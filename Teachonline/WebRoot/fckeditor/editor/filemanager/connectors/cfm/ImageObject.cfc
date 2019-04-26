<cfcomponent name="imgObject">
<!---
	imgObject.cfc written by Rick Root (rick@webworksllc.com)

	Related Web Sites:
	- http://www.opensourcecf.com/imgcfc (home page)


	This is an object oriented interface to the original
	imgCFC.

	Example Code:

	io = createObject("component","imgObject");
	io.setOption("defaultJpegCompression",95);
	io.init("#ExpandPath(".")#/emily.jpg");
	io.scaleWidth(500);
	io.save("#ExpandPath(".")#/imgx1.jpg");

	io.flipHorizontal();
	io.save("#ExpandPath(".")#/imgx2.jpg");
	io.revert();
	io.filterFastBlur(2,5);
	io.save("#ExpandPath(".")#/imgx3.jpg");
	io.revert();
	io.filterPosterize(32);
	io.save("#ExpandPath(".")#/imgx4.jpg");


	LICENSE
	-------
	Copyright (c) 2006, Rick Root <rick@webworksllc.com>
	All rights reserved.

	Redistribution and use in source and binary forms, with or
	without modification, are permitted provided that the
	following conditions are met:

	- Redistributions of source code must retain the above
	  copyright notice, this list of conditions and the
	  following disclaimer.
	- Redistributions in binary form must reproduce the above
	  copyright notice, this list of conditions and the
	  following disclaimer in the documentation and/or other
	  materials provided with the distribution.
	- Neither the name of the Webworks, LLC. nor the names of
	  its contributors may be used to endorse or promote products
	  derived from this software without specific prior written
	  permission.

	THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
	CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
	INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
	MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
	DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
	CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
	SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
	BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
	LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
	HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
	CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
	OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
	SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
--->

<cfset variables.img = "">
<cfset variables.revertimg = "">
<cfset variables.imgCFC = createObject("component","img")>
<cfset variables.imgInfo = structNew()>
	<cfset variables.imgInfo.width = 0>
	<cfset variables.imgInfo.height = 0>
	<cfset variables.imgInfo.colorModel = "">
	<cfset variables.imgInfo.colorspace = "">
	<cfset variables.imgInfo.objColorModel = "">
	<cfset variables.imgInfo.objColorspace = "">
	<cfset variables.imgInfo.sampleModel = "">
	<cfset variables.imgInfo.imgType = 0>
	<cfset variables.imgInfo.misc = "">
	<cfset variables.imgInfo.canModify = false>
<cfset variables.imgCFC.setOption("throwonerror",true)>

<!---

	init(filename)        Initialize object from a file.
	init(width, height)   Initialize with a blank img
	init(bufferedimg)   Initiailize with an existing object
--->
<cffunction name="init" access="public" output="false" returnType="void">
	<cfargument name="arg1" type="any" required="yes">
	<cfargument name="arg2" type="any" required="no">

	<cfif isDefined("arg2") and isNumeric(arg1) and isNumeric(arg2)>
		<cfset arg1 = javacast("int",int(arg1))>
		<cfset arg2 = javacast("int",int(arg2))>
		<cfset variables.img = createObject("java","java.awt.img.Bufferedimg")>
		<cfset variables.img.init(arg1,arg2,variables.img.TYPE_INT_RGB)>
	<cfelseif arg1.getClass().getName() eq "java.awt.img.Bufferedimg">
		<cfset variables.img = arg1>
	<cfelseif isSimpleValue(arg1) and len(arg1) gt 0>
		<cfset imgResults = variables.imgCFC.readimg(arg1, "no")>
		<cfset variables.img = imgResults.img>
	<cfelse>
		<cfthrow message="Object Instantiation Error" detail="You have attempted to initialize ooimg.cfc with invalid arguments.  Please consult the documentation for correct initialization arguments.">
	</cfif>
	<cfif variables.revertimg eq "">
		<cfset variables.revertimg = variables.img>
	</cfif>
	<cfset variables.imgInfo = imgCFC.getimgInfo(variables.img,"")>
	<cfreturn>
</cffunction>

<cffunction name="flipHorizontal" access="public" output="true" returnType="void" hint="Flip an img horizontally.">
	<cfset var imgResults = imgCFC.flipHorizontal(variables.img,"","")>
	<cfset variables.revertimg = variables.img>
	<cfset variables.img = imgResults.img>
	<cfset variables.imgInfo = imgCFC.getimgInfo(variables.img,"")>
</cffunction>

<cffunction name="getimgInfo" access="public" output="true" returntype="struct" hint="Returns img information.">
	<cfreturn variables.imgInfo>
</cffunction>
<cffunction name="getimgObject" access="public" output="true" returntype="struct" hint="Returns a java Buffered img Object.">
	<cfreturn variables.img>
</cffunction>

<cffunction name="flipVertical" access="public" output="true" returntype="void" hint="Flop an img vertically.">
	<cfset var imgResults = imgCFC.flipVertical(variables.img,"","")>
	<cfset variables.revertimg = variables.img>
	<cfset variables.img = imgResults.img>
	<cfset variables.imgInfo = imgCFC.getimgInfo(variables.img,"")>
</cffunction>

<cffunction name="scaleWidth" access="public" output="true" returntype="void" hint="Scale an img to a specific width.">
	<cfargument name="newWidth" required="yes" type="numeric">
	<cfset var imgResults = imgCFC.scaleWidth(variables.img,"","", newWidth)>
	<cfset variables.revertimg = variables.img>
	<cfset variables.img = imgResults.img>
	<cfset variables.imgInfo = imgCFC.getimgInfo(variables.img,"")>

</cffunction>

<cffunction name="scaleHeight" access="public" output="true" returntype="void" hint="Scale an img to a specific height.">
	<cfargument name="newHeight" required="yes" type="numeric">
	<cfset var imgResults = imgCFC.scaleHeight(variables.img,"","", newHeight)>
	<cfset variables.revertimg = variables.img>
	<cfset variables.img = imgResults.img>
	<cfset variables.imgInfo = imgCFC.getimgInfo(variables.img,"")>
</cffunction>

<cffunction name="resize" access="public" output="true" returntype="void" hint="Resize an img to a specific width and height.">
	<cfargument name="newWidth" required="yes" type="numeric">
	<cfargument name="newHeight" required="yes" type="numeric">
	<cfargument name="preserveAspect" required="no" type="boolean" default="FALSE">
	<cfargument name="cropToExact" required="no" type="boolean" default="FALSE">

	<cfset var imgResults = imgCFC.resize(variables.img,"","",newWidth,newHeight,preserveAspect,cropToExact)>
	<cfset variables.revertimg = variables.img>
	<cfset variables.img = imgResults.img>
	<cfset variables.imgInfo = imgCFC.getimgInfo(variables.img,"")>
</cffunction>

<cffunction name="crop" access="public" output="true" returntype="void" hint="Crop an img.">
	<cfargument name="fromX" required="yes" type="numeric">
	<cfargument name="fromY" required="yes" type="numeric">
	<cfargument name="newWidth" required="yes" type="numeric">
	<cfargument name="newHeight" required="yes" type="numeric">
	<cfset var imgResults = imgCFC.crop(variables.img,"","",fromX,fromY,newWidth,newHeight)>
	<cfset variables.revertimg = variables.img>
	<cfset variables.img = imgResults.img>
	<cfset variables.imgInfo = imgCFC.getimgInfo(variables.img,"")>

</cffunction>

<cffunction name="rotate" access="public" output="true" returntype="void" hint="Rotate an img (+/-)90, (+/-)180, or (+/-)270 degrees.">
	<cfargument name="degrees" required="yes" type="numeric">
	<cfset var imgResults = imgCFC.rotate(variables.img,"","",degrees)>
	<cfset variables.revertimg = variables.img>
	<cfset variables.img = imgResults.img>
	<cfset variables.imgInfo = imgCFC.getimgInfo(variables.img,"")>

</cffunction>

<cffunction name="setOption" access="public" output="true" returnType="void" hint="Sets values for allowed CFC options.">
	<cfargument name="key" type="string" required="yes">
	<cfargument name="val" type="string" required="yes">
	<cfif lcase(trim(key)) eq "throwonerror">
		<cfthrow message="Option Configuration Error" detail="You cannot set the throwOnError option when using imgObject.cfc">
	</cfif>
	<cfset imgCFC.setOption(key, val)>

</cffunction>

<cffunction name="getOption" access="public" output="true" returnType="any" hint="Returns the current value for the specified CFC option.">
	<cfargument name="key" type="string" required="yes">
	<cfreturn imgCFC.getOption(key)>
</cffunction>

<cffunction name="filterFastBlur" access="public" output="true" returntype="void" hint="Internal method used for flipping and flopping img.">
	<cfargument name="blurAmount" required="yes" type="numeric">
	<cfargument name="iterations" required="yes" type="numeric">
	<cfset var imgResults = imgCFC.filterFastBlur(variables.img,"","",blurAmount,iterations)>
	<cfset variables.revertimg = variables.img>
	<cfset variables.img = imgResults.img>
	<cfset variables.imgInfo = imgCFC.getimgInfo(variables.img,"")>

</cffunction>

<cffunction name="filterSharpen" access="public" output="true" returntype="void" hint="Internal method used for flipping and flopping img.">
	<cfset var imgResults = imgCFC.filterSharpen(variables.img,"","")>
	<cfset variables.revertimg = variables.img>
	<cfset variables.img = imgResults.img>
	<cfset variables.imgInfo = imgCFC.getimgInfo(variables.img,"")>

</cffunction>


<cffunction name="filterPosterize" access="public" output="true" returntype="void" hint="Internal method used for flipping and flopping img.">
	<cfargument name="amount" required="yes" type="string">
	<cfset var imgResults = imgCFC.filterPosterize(variables.img,"","",amount)>
	<cfset variables.revertimg = variables.img>
	<cfset variables.img = imgResults.img>
	<cfset variables.imgInfo = imgCFC.getimgInfo(variables.img,"")>
</cffunction>


<cffunction name="addText" access="public" output="true" returntype="void" hint="Add text to an img.">
	<cfargument name="x" required="yes" type="numeric">
	<cfargument name="y" required="yes" type="numeric">
	<cfargument name="fontDetails" required="yes" type="struct">
	<cfargument name="content" required="yes" type="String">
	<cfset var imgResults = imgCFC.addText(variables.img,"","",x,y,fontDetails,content)>
	<cfset variables.revertimg = variables.img>
	<cfset variables.img = imgResults.img>
	<cfset variables.imgInfo = imgCFC.getimgInfo(variables.img,"")>

</cffunction>

<cffunction name="watermark" access="public" output="false" returnType="void">
	<cfargument name="wmimg" required="yes" type="Any">
	<cfargument name="alpha" required="yes" type="numeric">
	<cfargument name="placeAtX" required="yes" type="numeric">
	<cfargument name="placeAtY" required="yes" type="numeric">

	<cfset var imgResults = "">
	<cfif isSimpleValue(wmimg)>
		<!--- filename or URL --->
		<cfset imgResults = imgCFC.watermark(variables.img,"","",wmimg,alpha,placeAtX,placeAtY)>
	<cfelse>
		<!--- must be a java object --->
		<cfset imgResults = imgCFC.watermark(variables.img,wmimg,"","",alpha,placeAtX,placeAtY)>
	</cfif>
	<cfset variables.revertimg = variables.img>
	<cfset variables.img = imgResults.img>
	<cfset variables.imgInfo = imgCFC.getimgInfo(variables.img,"")>

</cffunction>

<cffunction name="save" access="public" output="false" returnType="void">
	<cfargument name="filename" type="string" required="no">
	<cfargument name="jpegCompression" type="numeric" required="no">
	<cfif isDefined("arguments.jpegCompression") and isNumeric(arguments.jpegCompression)>
		<cfset imgCFC.writeimg(filename,variables.img,jpegCompression)>
	<cfelse>
		<cfset imgCFC.writeimg(filename,variables.img)>
	</cfif>
</cffunction>

<cffunction name="revert" access="public" output="true" returntype="void" hint="Undo the previous manipulation.">
	<cfset variables.img = variables.revertimg>
	<cfset variables.imgInfo = imgCFC.getimgInfo(variables.img,"")>
</cffunction>

</cfcomponent>
