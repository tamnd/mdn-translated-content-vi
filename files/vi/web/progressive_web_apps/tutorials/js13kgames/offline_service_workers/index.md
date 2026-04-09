---
title: "js13kGames: Làm PWA hoạt động ngoại tuyến với service worker"
short-title: Hỗ trợ ngoại tuyến bằng service worker
slug: Web/Progressive_web_apps/Tutorials/js13kGames/Offline_Service_workers
page-type: guide
sidebar: pwasidebar
---

{{PreviousMenuNext("Web/Progressive_web_apps/Tutorials/js13kGames/App_structure", "Web/Progressive_web_apps/Tutorials/js13kGames/Installable_PWAs", "Web/Progressive_web_apps/Tutorials/js13kGames")}}

Bây giờ khi đã thấy cấu trúc của js13kPWA trông như thế nào và đã thấy phần khung cơ bản đang chạy, hãy xem cách các khả năng ngoại tuyến được triển khai bằng service worker. Trong bài viết này, chúng ta sẽ xem nó được dùng như thế nào trong ví dụ [js13kPWA](https://mdn.github.io/pwa-examples/js13kpwa/) của chúng ta ([xem cả mã nguồn](https://github.com/mdn/pwa-examples/tree/main/js13kpwa)). Chúng ta sẽ xem cách thêm chức năng ngoại tuyến.

## Giải thích service worker

Service worker là một proxy ảo giữa trình duyệt và mạng. Nó giúp có thể cache đúng cách các tài sản của website và làm chúng sẵn có khi thiết bị của người dùng ngoại tuyến.

Chúng chạy trên một luồng riêng so với mã JavaScript chính của trang, và không có quyền truy cập vào cấu trúc DOM. Điều này tạo ra một cách tiếp cận khác với lập trình web truyền thống - API không chặn, và có thể gửi nhận trao đổi giữa các ngữ cảnh khác nhau. Bạn có thể giao cho Service Worker một việc để làm, rồi nhận kết quả bất cứ khi nào sẵn sàng bằng cách tiếp cận dựa trên [Promise](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise).

Service worker có thể làm nhiều hơn việc cung cấp khả năng ngoại tuyến, bao gồm xử lý thông báo hoặc thực hiện các phép tính nặng. Service worker rất mạnh vì chúng có thể kiểm soát các yêu cầu mạng, sửa đổi chúng, phục vụ các phản hồi tùy chỉnh lấy từ cache, hoặc tự tạo phản hồi hoàn toàn mới.

Để tìm hiểu thêm về service worker, xem [Offline and background operation](/en-US/docs/Web/Progressive_web_apps/Guides/Offline_and_background_operation).

## Service worker trong ứng dụng js13kPWA

Hãy xem ứng dụng js13kPWA dùng Service Worker để cung cấp khả năng ngoại tuyến như thế nào.

### Đăng ký Service Worker

Chúng ta bắt đầu bằng code đăng ký một Service Worker mới trong file app.js:

```js
let swRegistration = null;

if ("serviceWorker" in navigator) {
  navigator.serviceWorker
    .register("./pwa-examples/js13kpwa/sw.js")
    .then((reg) => {
      swRegistration = reg;
    });
}
```

Nếu service worker API được hỗ trợ trong trình duyệt, nó sẽ được đăng ký với site bằng phương thức {{domxref("ServiceWorkerContainer.register()")}}. Nội dung của nó nằm trong file sw.js, và có thể được thực thi sau khi đăng ký thành công. Đây là phần code Service Worker duy nhất nằm trong file app.js; mọi thứ còn lại mang tính Service Worker đều được viết trong chính file sw.js.

### Vòng đời của Service Worker

Khi đăng ký xong, file sw.js sẽ tự động được tải xuống, sau đó được cài đặt và cuối cùng được kích hoạt.

#### Cài đặt

API cho phép chúng ta thêm trình nghe sự kiện cho các sự kiện quan trọng mà ta quan tâm - sự kiện đầu tiên là `install`:

```js
self.addEventListener("install", (e) => {
  console.log("[Service Worker] Install");
});
```

Trong trình nghe `install`, chúng ta có thể khởi tạo cache và thêm file vào đó để dùng ngoại tuyến. Ứng dụng js13kPWA của chúng ta làm đúng như vậy.

Trước hết, một biến để lưu tên cache được tạo ra, và các file app shell được liệt kê trong một mảng.

```js
const cacheName = "js13kPWA-v1";
const appShellFiles = [
  "/pwa-examples/js13kpwa/",
  "/pwa-examples/js13kpwa/index.html",
  "/pwa-examples/js13kpwa/app.js",
  "/pwa-examples/js13kpwa/style.css",
  "/pwa-examples/js13kpwa/fonts/graduate.eot",
  "/pwa-examples/js13kpwa/fonts/graduate.ttf",
  "/pwa-examples/js13kpwa/fonts/graduate.woff",
  "/pwa-examples/js13kpwa/favicon.ico",
  "/pwa-examples/js13kpwa/img/js13kgames.png",
  "/pwa-examples/js13kpwa/img/bg.png",
  "/pwa-examples/js13kpwa/icons/icon-32.png",
  "/pwa-examples/js13kpwa/icons/icon-64.png",
  "/pwa-examples/js13kpwa/icons/icon-96.png",
  "/pwa-examples/js13kpwa/icons/icon-128.png",
  "/pwa-examples/js13kpwa/icons/icon-168.png",
  "/pwa-examples/js13kpwa/icons/icon-192.png",
  "/pwa-examples/js13kpwa/icons/icon-256.png",
  "/pwa-examples/js13kpwa/icons/icon-512.png",
];
```

Tiếp theo, các liên kết tới ảnh sẽ được tải cùng với nội dung từ file data/games.js được tạo trong mảng thứ hai. Sau đó, cả hai mảng được gộp bằng hàm {{jsxref("Array.prototype.concat()")}}.

```js
const gamesImages = [];
for (const game of games) {
  gamesImages.push(`data/img/${game.slug}.jpg`);
}
const contentToCache = appShellFiles.concat(gamesImages);
```

Sau đó chúng ta có thể xử lý chính sự kiện `install`:

```js
self.addEventListener("install", (e) => {
  console.log("[Service Worker] Install");
  e.waitUntil(
    (async () => {
      const cache = await caches.open(cacheName);
      console.log("[Service Worker] Caching all: app shell and content");
      await cache.addAll(contentToCache);
    })(),
  );
});
```

Ở đây có hai điều cần giải thích: {{domxref("ExtendableEvent.waitUntil")}} làm gì, và đối tượng {{domxref("Cache","caches")}} là gì.

Service worker sẽ không được cài đặt cho đến khi code bên trong `waitUntil` được thực thi. Nó trả về một promise - cách tiếp cận này cần thiết vì việc cài đặt có thể mất thời gian, nên chúng ta phải đợi nó hoàn thành.

`caches` là một đối tượng {{domxref("CacheStorage")}} đặc biệt có trong scope của Service Worker đó để cho phép lưu dữ liệu - lưu vào [web storage](/en-US/docs/Web/API/Web_Storage_API) sẽ không hiệu quả, vì web storage là đồng bộ. Với Service Worker, chúng ta dùng Cache API thay thế.

Ở đây, chúng ta mở một cache với tên cho trước, rồi thêm tất cả file ứng dụng dùng vào cache, để chúng sẵn có ở lần tải tiếp theo. Tài nguyên được xác định bằng URL request của chúng, là tương đối với {{domxref("WorkerGlobalScope.location", "location", "", 1)}} của worker.

Bạn có thể nhận thấy chúng ta chưa cache `game.js`. Đây là file chứa dữ liệu dùng khi hiển thị game. Thực tế, dữ liệu này rất có thể sẽ đến từ endpoint API hoặc cơ sở dữ liệu và việc cache dữ liệu sẽ đồng nghĩa với cập nhật định kỳ khi có kết nối mạng. Chúng ta sẽ không đi sâu vào đây, nhưng [Periodic Background Sync API](/en-US/docs/Web/API/Web_Periodic_Background_Synchronization_API) là tài liệu nên đọc thêm về chủ đề này.

#### Kích hoạt

Cũng có một sự kiện `activate`, được dùng tương tự như `install`. Sự kiện này thường được dùng để xóa các file không còn cần thiết và dọn dẹp sau ứng dụng nói chung. Trong ứng dụng của chúng ta không cần việc đó, nên sẽ bỏ qua.

### Phản hồi các lần fetch

Chúng ta cũng có sẵn sự kiện `fetch`, sự kiện này được kích hoạt mỗi khi ứng dụng phát ra một HTTP request. Điều này rất hữu ích, vì nó cho phép chúng ta chặn yêu cầu và phản hồi bằng các response tùy chỉnh. Ví dụ:

```js
self.addEventListener("fetch", (e) => {
  console.log(`[Service Worker] Fetched resource ${e.request.url}`);
});
```

Response có thể là bất cứ thứ gì chúng ta muốn: file được yêu cầu, bản sao cache của nó, hoặc một đoạn JavaScript làm điều gì đó cụ thể - khả năng là vô tận.

Trong ứng dụng ví dụ của chúng ta, chúng ta phục vụ nội dung từ cache thay vì từ mạng miễn là tài nguyên thực sự nằm trong cache. Chúng ta làm vậy dù ứng dụng đang trực tuyến hay ngoại tuyến. Nếu file không có trong cache, ứng dụng sẽ thêm nó vào trước rồi mới phục vụ:

```js
self.addEventListener("fetch", (e) => {
  e.respondWith(
    (async () => {
      const r = await caches.match(e.request);
      console.log(`[Service Worker] Fetching resource: ${e.request.url}`);
      if (r) {
        return r;
      }
      const response = await fetch(e.request);
      const cache = await caches.open(cacheName);
      console.log(`[Service Worker] Caching new resource: ${e.request.url}`);
      cache.put(e.request, response.clone());
      return response;
    })(),
  );
});
```

Ở đây, chúng ta phản hồi sự kiện fetch bằng một hàm cố tìm tài nguyên trong cache và trả về response nếu có. Nếu không, chúng ta dùng một request fetch khác để lấy từ mạng, rồi lưu response vào cache để lần sau có sẵn ở đó.

Phương thức {{domxref("FetchEvent.respondWith")}} giành quyền kiểm soát - đây là phần hoạt động như một proxy server giữa ứng dụng và mạng. Điều này cho phép chúng ta phản hồi mọi yêu cầu bằng bất kỳ response nào mình muốn: do Service Worker chuẩn bị, lấy từ cache, hoặc sửa đổi nếu cần.

Vậy là xong! Ứng dụng của chúng ta cache tài nguyên khi cài đặt và phục vụ chúng bằng fetch từ cache, nên vẫn hoạt động ngay cả khi người dùng ngoại tuyến. Nó cũng cache nội dung mới bất cứ khi nào nội dung đó được thêm vào.

## Cập nhật

Vẫn còn một điểm cần nói: làm thế nào để nâng cấp Service Worker khi có phiên bản mới của ứng dụng với các tài sản mới? Số phiên bản trong tên cache là chìa khóa ở đây:

```js
const cacheName = "js13kPWA-v1";
```

Khi cập nhật thành v2, chúng ta có thể thêm toàn bộ file của mình (bao gồm file mới) vào một cache mới:

```js
contentToCache.push("/pwa-examples/js13kpwa/icons/icon-32.png");

// …

self.addEventListener("install", (e) => {
  e.waitUntil(
    (async () => {
      const cache = await caches.open(cacheName);
      await cache.addAll(contentToCache);
    })(),
  );
});
```

Một service worker mới sẽ được cài trong nền, và phiên bản trước đó (v1) sẽ tiếp tục hoạt động đúng cho đến khi không còn trang nào dùng nó - khi đó Service Worker mới được kích hoạt và tiếp quản việc quản lý trang từ bản cũ.

## Xóa cache

Nhớ sự kiện `activate` mà chúng ta đã bỏ qua chứ? Nó có thể được dùng để xóa cache cũ không cần nữa:

```js
self.addEventListener("activate", (e) => {
  e.waitUntil(
    caches.keys().then((keyList) =>
      Promise.all(
        keyList.map((key) => {
          if (key === cacheName) {
            return undefined;
          }
          return caches.delete(key);
        }),
      ),
    ),
  );
});
```

Điều này đảm bảo chúng ta chỉ giữ lại các file cần thiết trong cache, không để lại rác; [dung lượng cache khả dụng trong trình duyệt có giới hạn](/en-US/docs/Web/API/Storage_API/Storage_quotas_and_eviction_criteria), nên dọn dẹp là một ý hay.

## Trường hợp sử dụng khác

Phục vụ file từ cache không phải là tính năng duy nhất Service Worker cung cấp. Nếu có các phép tính nặng, bạn có thể tách chúng khỏi luồng chính và xử lý trong worker, rồi nhận kết quả ngay khi có. Về mặt hiệu năng, bạn có thể prefetch các tài nguyên chưa cần ngay lúc này nhưng có thể cần trong tương lai gần, để ứng dụng nhanh hơn khi thực sự cần các tài nguyên đó.

## Tóm tắt
