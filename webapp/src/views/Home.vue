<template>
    <div class="home">
        <yandex-map class="main-map"
                    :settings="settings"
                    :coords="coords"
                    :zoom="10"
        >
            <ymap-marker
                    marker-id="123"
                    marker-type="circle"
                    :marker-fill="{color: '#FFF'}"
                    circle-radius="1400"
                    :balloon-template="balloonTemplate"
                    :coords="coords"
            />
        </yandex-map>
        <bottom-sheet-layout/>
    </div>
</template>

<script lang="js">
    import Vue from 'vue';
    //@ts-ignore
    import {yandexMap, ymapMarker} from 'vue-yandex-maps';
    import config from "@/common/YMapConfig";
    import BottomSheetLayout from "@/components/bottomSheet/BottomSheetLayout";

    export default Vue.extend({
        name: 'Home',
        components: {yandexMap, ymapMarker, BottomSheetLayout},
        mounted() {
            this.settings = config
        },
        data() {
            return {
                settings: {},
                coords: [55.751244, 37.618423],
            }
        },
        computed: {
            balloonTemplate() {
                return `
                    <h1 class="red">Hi, everyone!</h1>
                    <p>I am here: ${this.coords}</p>
                  `
            }
        },
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