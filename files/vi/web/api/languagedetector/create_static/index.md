---
title: "LanguageDetector: phương thức tĩnh create()"
short-title: create()
slug: Web/API/LanguageDetector/create_static
page-type: web-api-static-method
status:
  - experimental
browser-compat: api.LanguageDetector.create_static
---

{{APIRef("Translator and Language Detector APIs")}}{{SeeCompatTable}}{{securecontext_header}}

Phương thức tĩnh **`create()`** của giao diện {{domxref("LanguageDetector")}} tạo một phiên bản `LanguageDetector` mới để phát hiện ngôn ngữ.

> [!NOTE]
> Phương thức `create()` yêu cầu [kích hoạt tạm thời](/en-US/docs/Glossary/Transient_activation), nghĩa là nó phải được gọi trong phản hồi đối với hành động của người dùng như nhấp chuột hoặc nhấn nút.

## Cú pháp

```js-nolint
LanguageDetector.create(options)
```

### Tham số

- `options`
  - : Một đối tượng chỉ định các tùy chọn cấu hình cho `LanguageDetector`. Các giá trị có thể bao gồm:
    - `expectedInputLanguages`
      - : Một mảng các chuỗi chỉ định các ngôn ngữ dự kiến của văn bản đầu vào, giúp cải thiện độ chính xác của việc phát hiện ngôn ngữ. Đây phải là các thẻ ngôn ngữ {{glossary("BCP 47 language tag", "BCP 47")}} hợp lệ. Mặc định là `["en"]`.
    - `monitor` {{optional_inline}}
      - : Hàm callback với đối số {{domxref("CreateMonitor")}} cho phép theo dõi tiến trình tải xuống của mô hình AI.
    - `signal` {{optional_inline}}
      - : Một phiên bản đối tượng {{domxref("AbortSignal")}}, cho phép hủy bỏ thao tác `create()` thông qua {{domxref("AbortController")}} liên kết. Hiệu ứng chính xác phụ thuộc vào thời điểm {{domxref("AbortController.abort()")}} được gọi:
        - Nếu `abort()` được gọi trước khi promise `create()` giải quyết, thao tác `create()` sẽ bị hủy.
        - Nếu `abort()` được gọi sau khi promise `create()` hoàn thành, nó có tác dụng tương tự như gọi {{domxref("LanguageDetector.destroy()")}}: Các tài nguyên được gán cho phiên bản `LanguageDetector` kết quả được giải phóng, và bất kỳ lệnh gọi phương thức `LanguageDetector` đang diễn ra và tiếp theo sẽ từ chối với `AbortError`.

### Giá trị trả về

Một {{jsxref("Promise")}} hoàn thành với một phiên bản đối tượng `LanguageDetector`.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném nếu {{domxref("Document")}} của trang chưa hoạt động.
- `NetworkError` {{domxref("DOMException")}}
  - : Được ném nếu:
    - Mạng không có sẵn để tải xuống mô hình AI.
    - Người dùng đã hủy quá trình tải xuống mô hình AI.
- `NotAllowedError` {{domxref("DOMException")}}
  - : Được ném nếu:
    - Việc sử dụng phương thức bị chặn bởi {{httpheader('Permissions-Policy/language-detector','language-detector')}} {{httpheader("Permissions-Policy")}}.
    - Người dùng đã chặn việc tải xuống mô hình AI theo một cách nào đó.
    - Phương thức `create()` không được gọi thông qua {{glossary("transient activation")}}.
- `NotSupportedError` {{domxref("DOMException")}}
  - : Được ném nếu:
    - Các thẻ ngôn ngữ được chỉ định trong `expectedInputLanguages` không hợp lệ hoặc không được hỗ trợ.
    - Mô hình AI để hỗ trợ `expectedInputLanguages` đã chỉ định không có sẵn.
- `OperationError` {{domxref("DOMException")}}
  - : Ngoại lệ đa năng được ném nếu việc tạo `LanguageDetector` thất bại vì bất kỳ lý do nào khác.

## Ví dụ

### Tạo `LanguageDetector` cơ bản

```js
const detector = await LanguageDetector.create({
  expectedInputLanguages: ["en-US", "zh"],
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Translator and Language Detector APIs](/en-US/docs/Web/API/Translator_and_Language_Detector_APIs/Using)
