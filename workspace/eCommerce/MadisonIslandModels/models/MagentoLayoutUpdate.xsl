<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:template match="/">
        <layout>
            <xsl:text>&#xa;</xsl:text>
            <xsl:comment>Append Header_RewardActions block to the Header</xsl:comment>
            <default>
                <xsl:if test="//interactionFlowModelElements[@name='Header']/viewElements[@name='RecentRewardActions']">
                    <refrerence name="header">
                        <block type="MagentoEnhanced/Header_RewardActions"  template="enhanced/header/reward-actions.phtml" >
                            <label>Magento Enhanced Header Reward Actions</label>
                        </block>
                    </refrerence>
                </xsl:if>
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
                            <label>Magento Enhanced Highlighted Cateogry #<xsl:value-of select="position()"></xsl:value-of></label>
                        </block>
                    </xsl:for-each>
                </reference>
                <xsl:text>&#xa;</xsl:text>
                <xsl:text>&#xa;</xsl:text>
                <xsl:comment>Replace recent products with interaction products</xsl:comment>
                <xsl:if test="//interactionFlowModelElements[@name='Homepage']/viewElements[@name='RecentlyInteractedProducts']">
                    <remove name="homepage.new-products"></remove>
                    <reference name="content">
                        <block name="homepage.interacted-products" type="MagentoEnhanced/Catalog_ProducstInteracted" template="enhanced/catalog/products-interacted.phtml">
                            <label>Magento Enhanced Interacted Products</label>
                            <action method="setData">
                                <skuList>
                                     <xsl:variable name="body" select="//interactionFlowModelElements[@name='Homepage']/viewElements[@name='RecentlyInteractedProducts']/viewComponentParts/subViewComponentParts/@body" />
                                      <xsl:value-of select="substring-before(substring-after($body,'Product.sku IN ('),')')"/>
                                </skuList>
                            </action>
                        </block>
                    </reference>
                </xsl:if>

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
                <xsl:if test="//viewElements[@name='Shopping Cart Sidebar']/viewElements[@name='Applicable Reward Points']">
                    <reference name="cart.shopping-cart-sidebar">
                        <block type="MagentoEnhanced/Checkout_RewardPoints"  template="enhanced/checkout/reward-points.phtml">
                            <label>Magento Enhanced Checkout Reward Points</label>
                            <xsl:for-each
                                    select="//viewElements[@name='Shopping Cart Sidebar']/viewElements[@name='Applicable Reward Points']/viewComponentParts[@xsi:type='core:VisualizationAttribute']">
                            <action method="addItemRender"><type>simple</type><name><xsl:value-of select="@name" /></name></action>
                            </xsl:for-each>
                             </block>
                    </reference>
                </xsl:if>
            </checkout_cart_index>
        </layout>
    </xsl:template>
</xsl:stylesheet>

