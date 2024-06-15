import * as esbuild from "esbuild";
import postcss from "postcss";
import tailwindcss from "tailwindcss";
import autoprefixer from "autoprefixer";
import { sassPlugin } from "esbuild-sass-plugin";


// Function to build and optionally watch files
async function buildAndWatch() {
  const buildOptions = {
    entryPoints: ["app/javascript/*"], // Ensure correct entry point
    bundle: true,
    sourcemap: true,
    format: "esm",
    loader: {
      ".woff": "file",
      ".woff2": "file",
      ".ttf": "file",
      ".js": "jsx",
      ".png": "file",
      ".eot": "file",
    },
    outdir: "app/assets/builds",
    publicPath: "/assets",
    // plugins: [
    //   postcss({
    //     plugins: [tailwindcss("./config/tailwind.config.js"), autoprefixer],
    //   }),
    // ],
    // plugins: [
    //   sassPlugin({
    //     async transform(source) {
    //       const { css } = await postcss(
    //         tailwindcss("./config/tailwind.config.js"), 
    //         autoprefixer]).process(source, {
    //         from: undefined,
    //       });
    //       return css;
    //     },
    //   }),
    // ],
    plugins: [
      sassPlugin({
        async transform(source) {
          const { css } = await postcss([tailwindcss("./config/tailwind.config.js"),
            autoprefixer]).process(source);
          return css;
        },
      }),
    ],
  };

  const args = process.argv.slice(2);
  const isWatchMode = args.includes("--watch");

  if (isWatchMode) {
    const ctx = await esbuild.context(buildOptions);
    await ctx.watch();
    console.log("watching...");
  } else {
    try {
      await esbuild.build(buildOptions);
      console.log("Build succeeded");
    } catch (error) {
      console.error("Build failed:", error);
      process.exit(1);
    }
  }
}

// Run the build and watch process
buildAndWatch();
