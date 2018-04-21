<template>
    <div class="landing">
        <parralax :fixed="true">
            <div class="with-text">
                <img src="images/1.jpg" alt="">
                <p class="text">7Code - Millennium school</p>
            </div>
        </parralax>
        <parralax>
            <div class="with-text">
                <img src="images/2.jpg" alt="Login">
                <div class="actions">
                    <a href="/login" class="login btn btn-outline-primary active">Hai pe platforma :) </a>
                    <a href="/register" class="register btn btn-outline-secondary active">Sau creeaza un cont nou acum</a>
                </div>
            </div>
        </parralax>
    </div>
</template>
<script>
    import Parralax from 'vue-parallaxy'
    export default {
        name: 'Parallax',
        components: {
            Parralax
        }
    }
</script>
<style lang="scss">
    .landing {
        .with-text {
            position: relative !important;
            .text {
                font-size: 60px;
                position: absolute;
                top: 10%;
                color: #30b172;
                font-weight: 600;
                background-color: #e6e6e6b8;
                width: 100%;
                text-align: center;
            }
            .left-text {
                font-size: 60px;
                position: absolute;
                top: 10%;
                left: 10%;
                color: #30b177;
                font-weight:600;
            }
            .right-img {
            }
            .actions {
                width: 100%;
                position: absolute;
                top: 30%;
                height: 200px;
                background-color: #ece8e8ed;
                line-height: 200px;
                text-align: center;

                .login, .register {
                    border: none;
                    color: #0c77d8;
                    font-weight: 600;
                    border-bottom: 1px solid;
                    margin-right: 30px;
                    font-size: 26px;
                    outline: none;
                    background: transparent;
                    &:hover {
                        color: #389e76;
                    }
                }
            }
        }
        .Masthead:last-child {
            z-index: 1 !important;
        }
    }

</style>