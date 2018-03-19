<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">
    <xsl:template match="/">
        <layout>
            <!--Add Reward action to the Header-->
            <default>
            </default>
            <xsl:text>&#xa;</xsl:text>
            <xsl:comment>Set proper data for main banner carousel and replace recent products with interaction products</xsl:comment>
            <cms_index_index>
                <reference name="highlighted-categories-carousel">
                    <xsl:for-each
                            select="//interactionFlowModelElements[@name='Homepage']/viewElements[@name='HighlightedCategoriesCarousel']//parameters/constraints">
                        <block
                                type="MagentoEnhanced/Category_Enhanced"
                                template="enhanced/category/highlighted.phtml">
                            <xsl:attribute name="categoryId">
                                <xsl:value-of select="substring-after(@body,'Category.ID=')"/>
                            </xsl:attribute>
                        </block>
                    </xsl:for-each>
                </reference>
            </cms_index_index>
            <!--Add Related Product customization to Product Page-->
            <catalog_product_index>
            </catalog_product_index>
            <!-- Add Recently Viewed widget to Category page.-->
            <catalog_category_view>
            </catalog_category_view>
            <!-- Update the Shopping Cart with the Apply Reward section-->
            <checkout_cart_index>
            </checkout_cart_index>
        </layout>
    </xsl:template>
</xsl:stylesheet>

