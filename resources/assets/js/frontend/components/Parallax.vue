<template>
    <div class="landing">
        <div class="with-text">
            <img src="images/landing-header.png" alt="" class="landing-background">
        </div>
        <div class="with-text test">
            <p>Millenium School este locul in care poti primi si oferi informatii utile</p>
            <h4>Alatura-te comunitatii noastre</h4>
            <div class="col-8 align-self-center">
                <div class="row">
                    <div class="col-4">
                        <img src="images/junior.png" class="img-responsive" alt="">
                    </div>
                    <div class="col-4">
                        <img src="images/senior.png" class="img-responsive" alt="">
                    </div>
                    <div class="col-4">
                        <img src="images/teacher.png" class="img-responsive" alt="">
                    </div>
                </div>
            </div>
        </div>
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
    .navbar {
        position: fixed;
        top: 0;
        z-index:99;
        left: 0;
        right: 0;
        width: 100%;
    }
    .landing-background {
        width: 100%;
    }
    .test {
        margin: 50px 0;
        color: #6f6f6f;
        text-align: center;
    }
    .align-self-center {
        float:none;
        margin: 0 auto;
    }
    .test p {
        font-size: 22px;
    }

    .test h4 {
        font-size: 26px;
        font-weight:bold;
        margin-bottom: 20px;
    }
    .test img {
        float:none;
        margin:0 auto;
    }
</style>