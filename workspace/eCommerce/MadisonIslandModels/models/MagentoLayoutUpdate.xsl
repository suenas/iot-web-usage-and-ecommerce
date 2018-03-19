<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <layout>

                <cms_index_index>


                    <xsl:for-each select="//interactionFlowModelElements[@name='Homepage']/viewElements/viewElements/viewElements/parameters">
                        <reference name="<xsl:value-of select="/name"/>">
                            <block type="adminhtml/catalog_product_attribute_edit_tabs" name="attribute_edit_tabs"></block>
                        </reference>
                   </xsl:for-each>
                </cms_index_index>

        </layout>
    </xsl:template>
</xsl:stylesheet>

