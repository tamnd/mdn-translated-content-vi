---
title: "BackgroundFetchManager: phương thức fetch()"
short-title: fetch()
slug: Web/API/BackgroundFetchManager/fetch
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.BackgroundFetchManager.fetch
---

{{APIRef("Background Fetch API")}}{{SeeCompatTable}}{{AvailableInWorkers}}

Phương thức **`fetch()`** của giao diện {{domxref("BackgroundFetchManager")}} khởi tạo một thao tác background fetch, với một hoặc nhiều URL hoặc đối tượng {{domxref("Request")}}.

## Cú pháp

```js-nolint
fetch(id, requests)
fetch(id, requests, options)
```

### Tham số

- `id`
  - : Một mã nhận dạng do nhà phát triển định nghĩa, có thể được truyền cho các phương thức khác để truy xuất {{domxref("BackgroundFetchRegistration")}} của thao tác này.
- `requests`
  - : Một đối tượng `RequestInfo` hoặc một mảng các đối tượng `RequestInfo`.

    Mỗi đối tượng `RequestInfo` là một đối tượng {{domxref("Request")}} hoặc một chuỗi sẽ được truyền làm đối số `input` cho hàm khởi tạo {{domxref("Request.Request()", "Request()")}}.

- `options` {{optional_inline}}
  - : Một đối tượng sẽ được dùng để tùy biến hộp thoại tiến trình tải mà trình duyệt hiển thị cho người dùng. Nó có các thuộc tính sau:
    - `title` {{optional_inline}}
      - : Một chuỗi sẽ được dùng làm tiêu đề cho hộp thoại tiến trình.
    - `icons` {{optional_inline}}
      - : Một mảng các đối tượng, mỗi đối tượng biểu diễn một biểu tượng mà trình duyệt có thể dùng cho hộp thoại tiến trình. Mỗi đối tượng có các thuộc tính sau:
        - `src`
          - : Một chuỗi biểu diễn URL tới tệp biểu tượng.
        - `sizes` {{optional_inline}}
          - : Một chuỗi biểu diễn kích thước của hình ảnh, sử dụng cùng cú pháp với thuộc tính `sizes` của phần tử {{HTMLElement("link")}}.
        - `type` {{optional_inline}}
          - : Một chuỗi biểu diễn kiểu {{Glossary("MIME")}} của biểu tượng.
        - `label` {{optional_inline}}
          - : Một chuỗi biểu diễn tên truy cập được của biểu tượng.
    - `downloadTotal` {{optional_inline}}
      - : Một số biểu diễn tổng kích thước tải xuống ước tính, tính bằng byte, cho thao tác fetch. Giá trị này được dùng để cho người dùng biết tệp tải lớn đến đâu và để hiển thị tiến trình tải xuống.

        Ngay khi tổng kích thước tải xuống vượt quá `downloadTotal`, thao tác fetch sẽ bị hủy.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết bằng một đối tượng {{domxref("BackgroundFetchRegistration")}}.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Phát sinh nếu không có yêu cầu nào được cung cấp, nếu chế độ của một yêu cầu là `no-cors`, nếu không có service worker, nếu đã tồn tại một yêu cầu với `id` được yêu cầu, hoặc nếu yêu cầu thất bại.
- `AbortError` {{domxref("DOMException")}}
  - : Cho biết thao tác fetch đã bị hủy.
- `NotAllowedError` {{domxref("DOMException")}}
  - : Cho biết chưa có quyền của người dùng để thực hiện background fetch.
- {{domxref("QuotaExceededError")}}
  - : Được ném ra nếu việc lưu các yêu cầu thất bại do vượt quá [hạn mức lưu trữ](/en-US/docs/Web/API/Storage_API/Storage_quotas_and_eviction_criteria) của trình duyệt.

## Ví dụ

Ví dụ sau cho thấy cách dùng `fetch()` để khởi tạo một thao tác background fetch. Khi có một
{{domxref('ServiceWorker', 'service worker', "", "nocode")}} đang hoạt động, hãy dùng thuộc tính
{{domxref('ServiceWorkerRegistration.backgroundFetch')}} để truy cập đối tượng
`BackgroundFetchManager` và gọi phương thức `fetch()`
của nó.

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
          label: "Downloading a show",
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
