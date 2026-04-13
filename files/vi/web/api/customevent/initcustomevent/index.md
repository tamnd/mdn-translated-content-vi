---
title: "CustomEvent: phương thức initCustomEvent()"
short-title: initCustomEvent()
slug: Web/API/CustomEvent/initCustomEvent
page-type: web-api-instance-method
status:
  - deprecated
browser-compat: api.CustomEvent.initCustomEvent
---

{{APIRef("DOM")}}{{Deprecated_header}}{{AvailableInWorkers}}

Phương thức **`CustomEvent.initCustomEvent()`** khởi tạo một đối tượng {{domxref("CustomEvent")}}.
Nếu sự kiện đã được dispatch, phương thức này không làm gì cả.

Các sự kiện được khởi tạo theo cách này phải được tạo bằng phương thức {{domxref("Document.createEvent()")}}.
Phương thức này phải được gọi để đặt sự kiện trước khi nó được dispatch bằng {{ domxref("EventTarget.dispatchEvent()") }}.
Sau khi được dispatch, nó không còn làm gì nữa.

> [!NOTE]
> **Không sử dụng phương thức này nữa, vì nó đã lỗi thời.**
>
> Thay vì sử dụng tính năng này, hãy dùng các constructor sự kiện cụ thể, như {{domxref("CustomEvent.CustomEvent", "CustomEvent()")}}.
> Phần [Tạo và dispatch sự kiện](/en-US/docs/Web/API/Document_Object_Model/Events#creating_and_dispatching_events) cung cấp thêm thông tin về cách sử dụng những constructor đó.

## Cú pháp

```js-nolint
initCustomEvent(type, canBubble, cancelable, detail)
```

### Tham số

- `type`
  - : Một chuỗi chứa tên của sự kiện.
- `canBubble`
  - : Một giá trị boolean cho biết sự kiện có nổi bọt lên qua DOM hay không.
- `cancelable`
  - : Một giá trị boolean cho biết sự kiện có thể hủy được hay không.
- `detail`
  - : Bất kỳ dữ liệu nào sẽ khả dụng cho trình xử lý thông qua thuộc tính {{domxref("CustomEvent.detail")}}.

### Giá trị trả về

Không có (`undefined`).

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("CustomEvent")}}
- Constructor để sử dụng thay cho phương thức đã lỗi thời này: {{domxref("CustomEvent.CustomEvent", "CustomEvent()")}}.
