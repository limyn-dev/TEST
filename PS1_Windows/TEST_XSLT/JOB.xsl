<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text"/>

<xsl:template match="/">
   <xsl:text disable-output-escaping="yes">
   HEAD
   </xsl:text>
   <xsl:apply-templates/>
</xsl:template>
      
<xsl:template match="/J/S">
   <xsl:text disable-output-escaping="yes">
   $P = @{}
   </xsl:text>
   <xsl:apply-templates/>
   <xsl:text disable-output-escaping="yes">
   $S = @{}
   $S.Add('NME', </xsl:text>
                 <xsl:value-of select="./F"/>     
                 <xsl:text disable-output-escaping="yes">)
   $S.Add('FCT , </xsl:text>
                 <xsl:value-of select="./@sName"/>
                 <xsl:text disable-output-escaping="yes">)
   $S.Add('PRM', $P)
   </xsl:text>
</xsl:template>

<xsl:template match="/J/S/P">
   $P.Add('</xsl:text><xsl:value-of select="./@pName"/><xsl:text disable-output-escaping="yes">', </xsl:text><xsl:value-of select="."/><xsl:text disable-output-escaping="yes">    )
</xsl:stylesheet>