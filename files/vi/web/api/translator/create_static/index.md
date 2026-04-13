---
title: "Translator: create() static method"
short-title: create()
slug: Web/API/Translator/create_static
page-type: web-api-static-method
status:
  - experimental
browser-compat: api.Translator.create_static
---

{{APIRef("Translator and Language Detector APIs")}}{{SeeCompatTable}}{{securecontext_header}}

Phương thức tĩnh **`create()`** của giao diện {{domxref("Translator")}} tạo một đối tượng `Translator` mới có thể được sử dụng để dịch văn bản.

> [!NOTE]
> Phương thức `create()` yêu cầu [kích hoạt tạm thời](/en-US/docs/Glossary/Transient_activation), tức là phải được gọi trong phản hồi với hành động của người dùng như nhấp chuột hoặc nhấn nút.

## Cú pháp

```js-nolint
Translator.create(options)
```

### Tham số

- `options`
  - : Một đối tượng chỉ định các tùy chọn cấu hình cho `Translator`. Các giá trị có thể bao gồm:
    - `sourceLanguage`
      - : Một chuỗi chỉ định ngôn ngữ dự kiến của văn bản đầu vào cần dịch, phải là {{glossary("BCP 47 language tag")}} hợp lệ.
    - `targetLanguage`
      - : Một chuỗi chỉ định ngôn ngữ mà văn bản đầu vào sẽ được dịch sang, phải là BCP 47 language tag hợp lệ.
    - `monitor` {{optional_inline}}
      - : Một hàm callback với đối số {{domxref("CreateMonitor")}} cho phép theo dõi tiến trình tải xuống mô hình AI.
    - `signal` {{optional_inline}}
      - : Một đối tượng {{domxref("AbortSignal")}}, cho phép hủy thao tác `create()` qua {{domxref("AbortController")}} liên kết. Hiệu ứng chính xác phụ thuộc vào thời điểm {{domxref("AbortController.abort()")}} được gọi:
        - Nếu `abort()` được gọi trước khi promise `create()` giải quyết, thao tác `create()` sẽ bị hủy.
        - Nếu `abort()` được gọi sau khi promise `create()` thực hiện, nó có tác dụng tương tự như gọi {{domxref("Translator.destroy()")}}: Các tài nguyên được phân bổ cho đối tượng `Translator` được giải phóng, và bất kỳ lời gọi phương thức `Translator` đang diễn ra và tiếp theo sẽ từ chối với `AbortError`.

### Giá trị trả về

Một {{jsxref("Promise")}} thực hiện với một đối tượng `Translator`.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu {{domxref("Document")}} của trang chưa hoạt động.
- `NetworkError` {{domxref("DOMException")}}
  - : Được ném ra nếu:
    - Mạng không có sẵn để tải xuống mô hình AI.
    - Người dùng đã hủy tải xuống mô hình AI.
- `NotAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu:
    - Việc sử dụng phương thức bị chặn bởi {{httpheader('Permissions-Policy/translator','translator')}} {{httpheader("Permissions-Policy")}}.
    - Người dùng đã chặn tải xuống mô hình AI theo một cách nào đó.
    - Phương thức `create()` không được gọi thông qua {{glossary("transient activation")}}.
- `NotSupportedError` {{domxref("DOMException")}}
  - : Được ném ra nếu:
    - Các thẻ ngôn ngữ được chỉ định trong `sourceLanguage` hoặc `targetLanguage` không hợp lệ hoặc không được hỗ trợ. Điều này xảy ra nếu `sourceLanguage` và `targetLanguage` được chỉ định giống nhau.
    - Không có mô hình AI để hỗ trợ kết hợp `sourceLanguage` và `targetLanguage` được chỉ định.
- `OperationError` {{domxref("DOMException")}}
  - : Ngoại lệ đa mục đích được ném ra nếu việc tạo `Translator` thất bại vì bất kỳ lý do nào khác.

## Ví dụ

### Tạo `Translator` cơ bản

```js
const translator = await Translator.create({
  sourceLanguage: "en",
  targetLanguage: "ja",
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Translator và Language Detector APIs](/en-US/docs/Web/API/Translator_and_Language_Detector_APIs/Using)
