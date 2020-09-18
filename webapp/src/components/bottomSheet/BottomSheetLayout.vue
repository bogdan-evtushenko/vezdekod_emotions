<template>
    <swipeable-bottom-sheet ref="swipeableBottomSheet">
        <horizontal-scroll class="scroll">
            <div class="outer">
                <emotion v-for="em in emotion" :key="em.id" :main="em.main" :small="em.small"/>
            </div>
        </horizontal-scroll>
    </swipeable-bottom-sheet>
</template>

<script>
    import HorizontalScroll from 'vue-horizontal-scroll'
    import 'vue-horizontal-scroll/dist/vue-horizontal-scroll.css'
    import { SwipeableBottomSheet } from "vue-swipeable-bottom-sheet";
    import Emotion from "@/components/bottomSheet/Emotion";
    export default {
        name: "BottomSheetLayout",
        components: {
            SwipeableBottomSheet, HorizontalScroll, Emotion
        },
        data() {
            return {
                emotion: [
                    {
                        id: '1',
                        main: '🎧',
                        small: '😃'
                    },
                    {
                        id: '2',
                        main: '🍿',
                        small: '😃'
                    },
                    {
                        id: '3',
                        main: '🍂',
                        small: '😌'
                    },
                    {
                        id: '4',
                        main: '👔',
                        small: '😜'
                    },
                    {
                        id: '5',
                        main: '😷',
                        small: '😐'
                    },
                ]
            }
        }
    }
</script>

<style scoped lang="less">
.scroll {
    display: flex;
    width: 100%;
    height: 150px;
}
.outer {
    display: flex;
    flex: 1;
    width: auto;
    height: 100%;
    padding: 0 20px;
    flex-flow: row nowrap;
    align-items: center;
}
</style>