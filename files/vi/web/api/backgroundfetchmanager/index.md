---
title: BackgroundFetchManager
slug: Web/API/BackgroundFetchManager
page-type: web-api-interface
status:
  - experimental
browser-compat: api.BackgroundFetchManager
---

{{APIRef("Background Fetch API")}}{{SeeCompatTable}}{{AvailableInWorkers}}

Giao diện **`BackgroundFetchManager`** của {{domxref('Background Fetch API','','',' ')}} là một ánh xạ, trong đó khóa là các mã nhận dạng của background fetch và giá trị là các đối tượng {{domxref("BackgroundFetchRegistration")}}.

## Thuộc tính thể hiện

Không có.

## Phương thức thể hiện

- {{domxref('BackgroundFetchManager.fetch','fetch()' )}} {{Experimental_Inline}}
  - : Trả về một {{jsxref("Promise")}} được giải quyết bằng một đối tượng {{domxref("BackgroundFetchRegistration")}} cho một mảng URL và đối tượng {{domxref("Request")}} được cung cấp.
- {{domxref('BackgroundFetchManager.get','get()')}} {{Experimental_Inline}}
  - : Trả về một {{jsxref("Promise")}} được giải quyết bằng {{domxref("BackgroundFetchRegistration")}} gắn với `id` được cung cấp, hoặc {{jsxref("undefined")}} nếu không tìm thấy `id`.
- {{domxref('BackgroundFetchManager.getIds','getIds()')}} {{Experimental_Inline}}
  - : Trả về mã nhận dạng của tất cả background fetch đã đăng ký.

## Ví dụ

Ví dụ dưới đây cho thấy cách lấy một thể hiện `BackgroundFetchManager` từ một đối tượng {{domxref("ServiceWorkerRegistration")}} và gọi `fetch()` để tải một tệp âm thanh trong nền.

```js
navigator.serviceWorker.ready.then(async (swReg) => {
  const bgFetch = await swReg.backgroundFetch.fetch(
    "my-fetch",
    ["/ep-5.mp3", "ep-5-artwork.jpg"],
    {
      title: "Episode 5: Interesting things.",
      icons: [
        {
          sizes: "300x300",
          src: "/ep-5-icon.png",
          type: "image/png",
        },
      ],
      downloadTotal: 60 * 1024 * 1024,
    },
  );
});
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}
