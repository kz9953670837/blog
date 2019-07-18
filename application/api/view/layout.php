{include file="system@block/header" /}
{switch name="$hisiTabType"}
    {case value="1"}
        {/* 单个分组 */}
        <div class="layui-card">
            <div class="layui-tab layui-tab-brief">
                <ul class="layui-tab-title">
                    <li class="layui-this">
                        <a href="javascript:;" id="curTitle">{$hisiCurMenu['title']|raw}</a>
                    </li>
                </ul>
                <div class="layui-tab-content page-tab-content">
                    <div class="layui-tab-item layui-show">
                        {__CONTENT__}
                    </div>
                </div>
            </div>
        </div>
    {/case}
    {case value="2"}
        {/* 分组切换[无链接] */}
        <div class="layui-card">
            <div class="layui-tab layui-tab-brief">
                <ul class="layui-tab-title">
                    {volist name="hisiTabData['menu']" id="vo" key="k"}
                        {if condition="$k eq 1"}
                        <li class="layui-this">
                        {else /}
                        <li>
                        {/if}
                        <a href="javascript:;">{$vo['title']|raw}</a>
                        </li>
                    {/volist}
                </ul>
                <div class="layui-tab-content page-tab-content">
                    {__CONTENT__}
                </div>
            </div>
        </div>
    {/case}
    {case value="3"}
        {/* 分组切换[有链接] */}
        <div class="layui-card">
            <div class="layui-tab layui-tab-brief">
                <ul class="layui-tab-title">
                    {volist name="hisiTabData['menu']" id="vo"}
                        {php}
                            $hisiTabData['current'] = isset($hisiTabData['current']) ? $hisiTabData['current'] : '';
                        {/php}
                        {if condition="$vo['url'] eq $hisiCurMenu['url'] or (url($vo['url']) eq $hisiTabData['current'])"}
                        <li class="layui-this">
                        {else /}
                        <li>
                        {/if}
                        {if condition="substr($vo['url'], 0, 4) eq 'http'"}
                            <a href="{$vo['url']}" target="_blank">{$vo['title']|raw}</a>
                        {else /}
                            <a href="{:url($vo['url'])}">{$vo['title']|raw}</a>
                        {/if}
                        </li>
                    {/volist}
                </ul>
                <div class="layui-tab-content page-tab-content">
                    <div class="layui-tab-item layui-show">
                        {__CONTENT__}
                    </div>
                </div>
            </div>
        </div>
    {/case}
    {default /}
        {/* 无需分组切换 */}
        <div class="page-tab-content">
            {__CONTENT__}
        </div>
{/switch}
{include file="system@block/footer" /}