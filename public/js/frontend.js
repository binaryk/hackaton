/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "/";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ({

/***/ "./resources/assets/js/frontend/app.js":
/***/ (function(module, __webpack_exports__) {

"use strict";
throw new Error("Module build failed: SyntaxError: Unexpected token (26:0)\n\n\u001b[0m \u001b[90m 24 | \u001b[39m\u001b[33mVue\u001b[39m\u001b[33m.\u001b[39mcomponent(\u001b[32m'chat'\u001b[39m\u001b[33m,\u001b[39m require(\u001b[32m'./components/Chat/Chat.vue'\u001b[39m))\u001b[33m;\u001b[39m\n \u001b[90m 25 | \u001b[39m\u001b[33mVue\u001b[39m\u001b[33m.\u001b[39mcomponent(\u001b[32m'question-layout'\u001b[39m\u001b[33m,\u001b[39m require(\u001b[32m'./components/questions/single/QuestionLayout.vue'\u001b[39m))\u001b[33m;\u001b[39m\n\u001b[31m\u001b[1m>\u001b[22m\u001b[39m\u001b[90m 26 | \u001b[39m\u001b[33m<<\u001b[39m\u001b[33m<<\u001b[39m\u001b[33m<<\u001b[39m\u001b[33m<\u001b[39m \u001b[33mHEAD\u001b[39m\n \u001b[90m    | \u001b[39m\u001b[31m\u001b[1m^\u001b[22m\u001b[39m\n \u001b[90m 27 | \u001b[39m\u001b[33mVue\u001b[39m\u001b[33m.\u001b[39mcomponent(\u001b[32m'add-comment'\u001b[39m\u001b[33m,\u001b[39m require(\u001b[32m'./components/comments/AddComment.vue'\u001b[39m))\u001b[33m;\u001b[39m\n \u001b[90m 28 | \u001b[39m\u001b[33mVue\u001b[39m\u001b[33m.\u001b[39mcomponent(\u001b[32m'comments-list'\u001b[39m\u001b[33m,\u001b[39m require(\u001b[32m'./components/comments/List.vue'\u001b[39m))\u001b[33m;\u001b[39m\n \u001b[90m 29 | \u001b[39m\u001b[33m===\u001b[39m\u001b[33m===\u001b[39m\u001b[33m=\u001b[39m\u001b[0m\n");

/***/ }),

/***/ "./resources/assets/sass/backend/app.scss":
/***/ (function(module, exports) {

// removed by extract-text-webpack-plugin

/***/ }),

/***/ "./resources/assets/sass/frontend/app.scss":
/***/ (function(module, exports) {

// removed by extract-text-webpack-plugin

/***/ }),

/***/ 0:
/***/ (function(module, exports, __webpack_require__) {

__webpack_require__("./resources/assets/js/frontend/app.js");
__webpack_require__("./resources/assets/sass/frontend/app.scss");
module.exports = __webpack_require__("./resources/assets/sass/backend/app.scss");


/***/ })

/******/ });