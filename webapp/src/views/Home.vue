<template>
    <div class="home">
        <yandex-map class="main-map"
                    :settings="settings"
                    :coords="coords"
                    :zoom="10"
        >
            <ymap-marker
                    marker-id="123"
                    :coords="coords"
                    :icon="markerIcon"
            />
        </yandex-map>
    </div>
</template>

<script lang="ts">
    import Vue from 'vue';
    //@ts-ignore
    import {yandexMap, ymapMarker} from 'vue-yandex-maps';
    import config from "@/common/YMapConfig";

    export default Vue.extend({
        name: 'Home',
        components: {yandexMap, ymapMarker},
        mounted() {
            this.settings = config
        },
        data() {
            return {
                settings: {},
                coords: [55.751244, 37.618423],
                markerIcon: {
                    layout: 'default#imageWithContent',
                    imageHref: 'https://image.flaticon.com/icons/png/512/33/33447.png',
                    imageSize: [55.751244, 37.618423],
                    imageOffset: [0, 0],
                    content: '123 v12',
                    contentOffset: [0, 15],
                    contentLayout: '<div style="background: red; width: 50px; color: #FFFFFF; font-weight: bold;">$[properties.iconContent]</div>'
                }
            }
        }
    });
</script>

<style lang="less">
    .home {
        width: 100%;
        height: 100%;

        .main-map {
            width: 100vw;
            height: 100vh;
        }
    }
</style>