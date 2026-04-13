---
title: "XMLHttpRequest: thuộc tính timeout"
short-title: timeout
slug: Web/API/XMLHttpRequest/timeout
page-type: web-api-instance-property
browser-compat: api.XMLHttpRequest.timeout
---

{{APIRef("XMLHttpRequest API")}} {{AvailableInWorkers("window_and_worker_except_service")}}

Thuộc tính **`XMLHttpRequest.timeout`** là một `unsigned long` đại diện cho số mili giây mà một yêu cầu có thể kéo dài trước khi tự động bị chấm dứt. Giá trị mặc định là 0, có nghĩa là không có thời gian chờ. Không nên sử dụng timeout cho các yêu cầu XMLHttpRequest đồng bộ được sử dụng trong {{Glossary('document environment')}} hoặc nó sẽ ném một ngoại lệ `InvalidAccessError`. Khi hết thời gian chờ, một sự kiện [timeout](/en-US/docs/Web/API/XMLHttpRequestEventTarget/timeout_event) được kích hoạt.

> [!NOTE]
> Bạn không thể sử dụng timeout cho các yêu cầu đồng bộ với một cửa sổ sở hữu.

[Sử dụng timeout với một yêu cầu không đồng bộ](/en-US/docs/Web/API/XMLHttpRequest_API/Synchronous_and_Asynchronous_Requests#example_using_a_timeout).

## Ví dụ

```js
const xhr = new XMLHttpRequest();
xhr.open("GET", "/server", true);

xhr.timeout = 2000; // thời gian tính bằng mili giây

xhr.onload = () => {
  // Yêu cầu đã hoàn tất. Xử lý tại đây.
};

xhr.ontimeout = (e) => {
  // XMLHttpRequest đã hết thời gian chờ. Làm gì đó tại đây.
};

xhr.send(null);
```

## Các đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
