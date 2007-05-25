<!-----------------------------------------------------------------------Author 	 :	Your NameDate     :	September 25, 2005Description : 			Unit Tests	-----------------------------------------------------------------------><cfcomponent name="ehGeneralTest" extends="org.cfcunit.framework.TestCase" output="false">		<cffunction name="setUp" returntype="void" access="private"> 		<!--- Setup ColdBox Mappings --->		<cfset variables.AppMapping = "/applications/coldbox/ApplicationTemplate/">		<cfset variables.HandlerMapping = ExpandPath(AppMapping & "handlers")>		<cfset variables.ConfigMapping = ExpandPath(AppMapping & "config/config.xml.cfm")>		<!--- Initalize ColdBox --->		<cfset variables.controller = CreateObject("component", "coldbox.system.controller").init()>		<!--- Load Config --->		<cfset variables.controller.getService("loader").configLoader(variables.ConfigMapping)>		<!--- Set App Mapping --->		<cfset variables.controller.setSetting("AppMapping", variables.AppMapping)>		<cfset variables.controller.setSetting("ApplicationPath", expandPath(variables.AppMapping))>		<cfset variables.controller.setSetting("HandlersPath",variables.HandlerMapping)>		<!--- Finish Registration --->		<cfset variables.controller.getService("loader").registerHandlers()>	</cffunction>		<cffunction name="testdspHello" access="public" returntype="void" output="false">		<cfdump var="#controller.getConfigSettings()#"><cfaborT>		<cfscript>		//execute event				//Do your asserts				</cfscript>	</cffunction>		<cffunction name="testdoSomething" access="public" returntype="void" output="false">			</cffunction>	</cfcomponent>