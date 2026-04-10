---
title: "HTMLIFrameElement: thuộc tính contentWindow"
short-title: contentWindow
slug: Web/API/HTMLIFrameElement/contentWindow
page-type: web-api-instance-property
browser-compat: api.HTMLIFrameElement.contentWindow
---

{{APIRef("HTML DOM")}}

Thuộc tính **`contentWindow`** trả về đối tượng [Window](/en-US/docs/Web/API/Window) của một [HTMLIFrameElement](/en-US/docs/Web/API/HTMLIFrameElement).

Thuộc tính này chỉ đọc.

## Giá trị

Một đối tượng [Window](/en-US/docs/Web/API/Window).

## Mô tả

Quyền truy cập vào {{domxref("Window")}} được trả về bởi `contentWindow` phải tuân theo các quy tắc được xác định bởi [chính sách cùng nguồn gốc](/en-US/docs/Web/Security/Defenses/Same-origin_policy), nghĩa là nếu iframe có cùng nguồn gốc với trang cha, thì trang cha có thể truy cập tài liệu và DOM nội bộ của iframe, và nếu chúng khác nguồn gốc, nó sẽ có quyền truy cập rất hạn chế vào các thuộc tính của window. Xem ["Truy cập API script khác nguồn gốc"](/en-US/docs/Web/Security/Defenses/Same-origin_policy#cross-origin_script_api_access) để biết chi tiết.

Các trang cũng có thể sử dụng thuộc tính này để tìm hiểu iframe nào đã gửi tin nhắn bằng {{domxref("Window.postMessage()")}}, bằng cách so sánh nó với thuộc tính {{domxref("MessageEvent.source", "source")}} của sự kiện tin nhắn.

## Ví dụ

### Truy cập tài liệu của iframe

Ví dụ này sửa đổi thuộc tính `style` của phần tử body trong tài liệu.

Lưu ý rằng điều này chỉ hoạt động nếu window của iframe có cùng nguồn gốc với trang cha: ngược lại, việc truy cập `contentWindow.document` sẽ ném ra ngoại lệ.

```js
const iframe = document.querySelector("iframe").contentWindow;

iframe.document.querySelector("body").style.backgroundColor = "blue";
// dòng này sẽ chuyển iframe đầu tiên trong tài liệu thành màu xanh dương.
```

### Ánh xạ nguồn tin nhắn với các iframe

Ví dụ này có thể chạy trong một trang lưu trữ nhiều iframe, bất kỳ iframe nào trong số đó có thể gửi tin nhắn đến trang bằng {{domxref("Window.postMessage()")}}. Khi trang nhận được tin nhắn, nó muốn biết iframe nào chứa window đã gửi tin nhắn.

Để thực hiện điều này, khi nhận được tin nhắn, trang trước tiên kiểm tra xem tin nhắn có đến từ nguồn gốc dự kiến hay không, sau đó tìm iframe là nguồn của tin nhắn bằng cách so sánh thuộc tính {{domxref("MessageEvent.source", "source")}} của sự kiện tin nhắn với thuộc tính `contentWindow` của iframe.

```js
const expectedOrigin = "https://example.org";

const iframes = Array.from(document.querySelectorAll("iframe"));

window.addEventListener("message", (e) => {
  if (e.origin !== expectedOrigin) return;

  const sourceIframe = iframes.find(
    (iframe) => iframe.contentWindow === e.source,
  );

  console.log(sourceIframe);
});
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
