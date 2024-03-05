import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [react()],
  server: {
    // This will allow the dev server to be exposed
    host: true,
    watch: {
      // This will enable hot-reloading in docker container
      usePolling: true,
    },
  },
});
