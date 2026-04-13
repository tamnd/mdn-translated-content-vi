---
title: "InstallEvent: addRoutes() method"
short-title: addRoutes()
slug: Web/API/InstallEvent/addRoutes
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.InstallEvent.addRoutes
---

{{APIRef("Service Workers API")}}{{SeeCompatTable}}

Phương thức **`addRoutes()`** của giao diện {{domxref("InstallEvent")}} chỉ định một hoặc nhiều tuyến tĩnh, định nghĩa các quy tắc tải tài nguyên được chỉ định sẽ được sử dụng ngay cả trước khi service worker khởi động. Điều này cho phép bạn, ví dụ, bỏ qua service worker trong trường hợp bạn luôn muốn tải tài nguyên từ mạng hoặc từ {{domxref("Cache")}} của trình duyệt, tránh chi phí hiệu suất do các chu kỳ service worker không cần thiết.

## Cú pháp

```js-nolint
addRoutes(routerRules)
```

### Tham số

- `routerRules`
  - : Một đối tượng đơn lẻ, hoặc một mảng gồm một hoặc nhiều đối tượng, đại diện cho các quy tắc về cách tải một số tài nguyên nhất định. Mỗi đối tượng `routerRules` chứa các thuộc tính sau:
    - `condition`
      - : Một đối tượng định nghĩa một hoặc nhiều điều kiện chỉ định tài nguyên nào khớp với quy tắc này. Các thuộc tính sau có thể được bao gồm; nếu nhiều thuộc tính được sử dụng, tài nguyên phải đáp ứng tất cả các điều kiện được chỉ định để khớp với quy tắc.
        - `not` {{optional_inline}}
          - : Một đối tượng `condition` định nghĩa các điều kiện **không** được đáp ứng để khớp với quy tắc. Các điều kiện định nghĩa bên trong điều kiện `not` loại trừ lẫn nhau với các điều kiện khác.
        - `or` {{optional_inline}}
          - : Một mảng các đối tượng `condition`. Một tập hợp các điều kiện được định nghĩa phải được đáp ứng để khớp với quy tắc. Các điều kiện định nghĩa bên trong điều kiện `or` loại trừ lẫn nhau với các điều kiện khác.
        - `requestMethod` {{optional_inline}}
          - : Một chuỗi đại diện cho [phương thức HTTP](/en-US/docs/Web/HTTP/Reference/Methods) mà yêu cầu phải được gửi để khớp với quy tắc, ví dụ `"get"`, `"put"`, hoặc `"head"`.
        - `requestMode` {{optional_inline}}
          - : Một chuỗi đại diện cho [chế độ](/en-US/docs/Web/API/Request/mode) mà yêu cầu phải có để khớp với quy tắc, ví dụ `"same-origin"`, `"no-cors"`, hoặc `"cors"`.
        - `requestDestination` {{optional_inline}}
          - : Một chuỗi đại diện cho [đích](/en-US/docs/Web/API/Request/destination) của yêu cầu, tức là loại nội dung được yêu cầu, để khớp với quy tắc. Ví dụ bao gồm `"audio"`, `"document"`, `"script"`, và `"worker"`.
        - `runningStatus` {{optional_inline}}
          - : Một giá trị liệt kê đại diện cho trạng thái chạy cần thiết của service worker để yêu cầu khớp với quy tắc. Các giá trị có thể là `"running"` hoặc `"not-running"`.
        - `urlPattern` {{optional_inline}}
          - : Một đối tượng {{domxref("URLPattern")}}, hoặc mẫu [`input`](/en-US/docs/Web/API/URLPattern/URLPattern#input) của hàm khởi tạo `URLPattern()` đại diện cho các URL khớp với quy tắc. Không cho phép nhóm biểu thức chính quy, vì vậy {{domxref("URLPattern.hasRegExpGroups")}} phải là `false`.

    - `source`
      - : Một giá trị liệt kê hoặc một đối tượng chỉ định nguồn mà tài nguyên phù hợp sẽ được tải. Các giá trị liệt kê có thể là:
        - `"cache"`
          - : Tài nguyên sẽ được tải từ {{domxref("Cache")}} của trình duyệt.
        - `"fetch-event"`
          - : Tài nguyên sẽ được tải qua trình xử lý sự kiện {{DOMxRef("ServiceWorkerGlobalScope.fetch_event", "fetch")}} của service worker. Có thể kết hợp với điều kiện `"runningStatus"` để tải tài nguyên từ service worker nếu đang chạy và chuyển sang tuyến tĩnh trên mạng nếu không chạy.
        - `"network"`
          - : Tài nguyên sẽ được tải từ mạng.
        - `"race-network-and-fetch-handler"`
          - : Các lần thử tải tài nguyên từ mạng và từ trình xử lý sự kiện {{DOMxRef("ServiceWorkerGlobalScope.fetch_event", "fetch")}} của service worker được thực hiện đồng thời. Cái nào hoàn thành trước sẽ được sử dụng.

        Giá trị `source` cũng có thể được đặt thành một đối tượng chứa một thuộc tính duy nhất, `cacheName`, có giá trị là một chuỗi đại diện cho tên của {{domxref("Cache")}} của trình duyệt. Tài nguyên phù hợp sẽ được tải từ cache được đặt tên cụ thể này nếu tồn tại.

### Giá trị trả về

Một {{jsxref("Promise")}} thực hiện với `undefined`.

### Ngoại lệ

- `TypeError` {{domxref("DOMException")}}
  - : Ném ra nếu một hoặc nhiều đối tượng quy tắc bên trong `routerRules` không hợp lệ, hoặc có giá trị `source` là `"fetch-event"` khi service worker liên quan không có trình xử lý sự kiện {{DOMxRef("ServiceWorkerGlobalScope.fetch_event", "fetch")}}. Cũng ném ra nếu bạn cố kết hợp `or` với loại điều kiện khác.

## Ví dụ

### Định tuyến các yêu cầu cụ thể đến mạng nếu service worker không chạy

Trong ví dụ sau, các URL bắt đầu bằng `/articles` được định tuyến đến mạng nếu service worker hiện không chạy:

```js
addEventListener("install", (event) => {
  event.addRoutes({
    condition: {
      urlPattern: "/articles/*",
      runningStatus: "not-running",
    },
    source: "network",
  });
});
```

### Định tuyến các yêu cầu POST của biểu mẫu đến mạng

Trong ví dụ sau, các yêu cầu [`POST`](/en-US/docs/Web/HTTP/Reference/Methods/POST) đến một biểu mẫu được gửi trực tiếp đến mạng và bỏ qua service worker:

```js
addEventListener("install", (event) => {
  event.addRoutes({
    condition: {
      urlPattern: "/form/*",
      requestMethod: "post",
    },
    source: "network",
  });
});
```

### Định tuyến các yêu cầu loại hình ảnh nhất định đến cache được đặt tên

Trong ví dụ sau, {{domxref("Cache")}} của trình duyệt tên `"pictures"` được sử dụng để tải các tệp có phần mở rộng `.png` hoặc `.jpg`:

```js
addEventListener("install", (event) => {
  event.addRoutes({
    condition: {
      or: [{ urlPattern: "*.png" }, { urlPattern: "*.jpg" }],
    },
    source: {
      cacheName: "pictures",
    },
  });
});
```

> [!NOTE]
> Nếu cache không tồn tại, trình duyệt mặc định sử dụng mạng để tài nguyên được yêu cầu vẫn có thể được lấy miễn là mạng khả dụng.

Bạn không thể kết hợp `or` với điều kiện khác, vì điều này dẫn đến `TypeError`. Ví dụ, nếu bạn muốn khớp các tệp có phần mở rộng `.png` hoặc `.jpg` nhưng chỉ khi `requestMethod` là `get`, bạn cần chỉ định hai điều kiện riêng biệt:

```js
addEventListener("install", (event) => {
  event.addRoutes(
    {
      condition: {
        urlPattern: "*.png",
        requestMethod: "get",
      },
      source: {
        cacheName: "pictures",
      },
    },
    {
      condition: {
        urlPattern: "*.jpg",
        requestMethod: "get",
      },
      source: {
        cacheName: "pictures",
      },
    },
  );
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("InstallEvent")}}
- [sự kiện `install`](/en-US/docs/Web/API/ServiceWorkerGlobalScope/install_event)
- [Service Worker API](/en-US/docs/Web/API/Service_Worker_API)
- [Use the Service Worker Static Routing API to bypass the service worker for specific paths](https://developer.chrome.com/blog/service-worker-static-routing) on `developer.chrome.com` (2024)
