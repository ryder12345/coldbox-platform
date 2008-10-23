<!-----------------------------------------------------------------------********************************************************************************Copyright 2005-2008 ColdBox Framework by Luis Majano and Ortus Solutions, Corpwww.coldboxframework.com | www.luismajano.com | www.ortussolutions.com********************************************************************************Author 	    :	Luis MajanoDate        :	September 23, 2005Description :	This is a cfc that all event handlers should extendModification History:01/12/2006 - Added fix for whitespace management.06/08/2006 - Updated for coldbox07/29/2006 - Datasource support via getdatsource()-----------------------------------------------------------------------><cfcomponent name="eventhandler"			 hint="This is the event handler base cfc."			 output="false"			 extends="frameworkSupertype"><!------------------------------------------- CONSTRUCTOR ------------------------------------------->	<!--- Public Exposed Functionality Properties --->	<cfset this.EVENT_CACHE_SUFFIX = "">	<cffunction name="init" access="public" returntype="any" output="false" hint="The event handler controller">		<cfargument name="controller" type="any" required="true" hint="coldbox.system.controller">		<cfscript>			/* Register Controller */			setController(arguments.controller);						/* Inject user dependencies. */			includeUDF(getController().getSetting("UDFLibraryFile"));			/* Return Instance */			return this;		</cfscript>	</cffunction><!------------------------------------------- PUBLIC ------------------------------------------->	<!--- Invoker Mixin --->	<cffunction name="_privateInvoker" hint="calls private/packaged/public methods. Used internally by coldbox to execute private events" access="public" returntype="any" output="false">		<!--- ************************************************************* --->		<cfargument name="method" 		 type="string" required="Yes" hint="Name of the method to call">		<cfargument name="argCollection" type="struct" required="No"  hint="Can be called with an argument collection struct">		<cfargument name="argList" 		 type="string" required="No"  hint="Can be called with an argument list, for simple values only: ex: 'plugin=logger,number=1'">		<!--- ************************************************************* --->		<cfset var results = "">		<cfset var key = "">				<!--- Determine type of invocation --->		<cfif structKeyExists(arguments,"argCollection")>			<cfinvoke method="#arguments.method#" 					  returnvariable="results" 					  argumentcollection="#arguments.argCollection#" />		<cfelseif structKeyExists(arguments, "argList")>			<cfinvoke method="#arguments.method#" 					  returnvariable="results">				<cfloop list="#argList#" index="key">					<cfinvokeargument name="#listFirst(key,'=')#" value="#listLast(key,'=')#">				</cfloop>			</cfinvoke>		<cfelse>			<cfinvoke method="#arguments.method#" 					  returnvariable="results" />		</cfif>				<!--- Return results if Found --->		<cfif isDefined("results")>			<cfreturn results>		</cfif>	</cffunction><!------------------------------------------- PRIVATE -------------------------------------------></cfcomponent>