// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"

import "trix"
import "@rails/actiontext"
import "./controllers"

import Rails from "@rails/ujs"
import * as ActiveStorage from "@rails/activestorage"
import "./channels"

Rails.start()
ActiveStorage.start()

import './src/submit_on_click_or_input.js'
import './src/chartist.js'
import "./src/choices.js"
import './src/direct_uploads.js'
import './src/ga.js'

import "./stylesheets/application.tailwind.css"
import "./stylesheets/custom.scss"
import 'chartist/dist/index.css';
