<template>
    <div>
        <div class="emotion">
            <div class="small">{{small}}</div>
            {{main}}
        </div>
    </div>
</template>

<script>
    export default {
        name: "Emotion",
        props: {
            main: {
                type: String, default: '🎧'
            },
            small: {
                type: String, default: '😃'
            }
        }
    }
</script>

<style scoped lang="less">
.small {
    width: 15px;
    height: 15px;
    border-radius: 50%;
    background: white;
    border: 0.5px solid rgba(0, 0, 0, 0.14);
    position: absolute;
    left: 0;
    top: 5px;
}
.emotion {
    position: relative;
    width: 75px;
    height: 75px;
    border-radius: 50%;
    background: white;
    display: flex;
    flex-shrink: 0;
    align-items: center;
    justify-content: center;
    border: 0.5px solid rgba(0, 0, 0, 0.14);
    margin-left: 10px;
    margin-right: 10px;
}
</style>