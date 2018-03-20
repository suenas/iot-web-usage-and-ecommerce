<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">
    <xsl:template match="/">
        <layout>
            <!--Add Reward action to the Header-->
            <default>
            </default>
            <xsl:text>&#xa;</xsl:text>
            <cms_index_index>
                <xsl:text>&#xa;</xsl:text>
                <xsl:text>&#xa;</xsl:text>
                <xsl:comment>Set proper data for main banner carousel</xsl:comment>
                <reference name="highlighted-categories-carousel">
                    <xsl:for-each
                            select="//interactionFlowModelElements[@name='Homepage']/viewElements[@name='HighlightedCategoriesCarousel']//parameters/constraints">
                        <block
                                type="MagentoEnhanced/Homepage_CategoryHighlighted"
                                template="enhanced/homepage/category/highlighted.phtml">
                            <xsl:attribute name="categoryId">
                                <xsl:value-of select="substring-after(@body,'Category.ID=')"/>
                            </xsl:attribute>
                        </block>
                    </xsl:for-each>
                </reference>
                <xsl:text>&#xa;</xsl:text>
                <xsl:text>&#xa;</xsl:text>
                <xsl:comment>Replace recent products with interaction products</xsl:comment>

                <xsl:template match="//interactionFlowModelElements[@name='Homepage']/viewElements[@name='RecentlyInteractedProducts']">
                    <remove name="homepage.new-products"></remove>
                    <reference name="content">
                        <block name="homepage.interacted-products" type="MagentoEnhanced/Catalog_ProducstInteracted" template="enhanced/catalog/products-interacted.phtml">
                            <action method="setData">
                                <skuList>
                                    <xsl:value-of  select="."/>
                                </skuList>
                            </action>
                        </block>
                    </reference>
                </xsl:template>

            </cms_index_index>
            <xsl:text>&#xa;</xsl:text>
            <xsl:comment>Add Related Product customization to Product Page</xsl:comment>
            <catalog_product_index>
            </catalog_product_index>
            <xsl:text>&#xa;</xsl:text>
            <xsl:comment>Add Recently Viewed widget to Category page</xsl:comment>
            <catalog_category_view>
            </catalog_category_view>
            <xsl:text>&#xa;</xsl:text>
            <xsl:comment>Update the Shopping Cart appending the Apply Reward section</xsl:comment>
            <checkout_cart_index>
            </checkout_cart_index>
        </layout>
    </xsl:template>
</xsl:stylesheet>

