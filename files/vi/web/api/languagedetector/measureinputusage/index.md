---
title: "LanguageDetector: phương thức measureInputUsage()"
short-title: measureInputUsage()
slug: Web/API/LanguageDetector/measureInputUsage
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.LanguageDetector.measureInputUsage
---

{{APIRef("Translator and Language Detector APIs")}}{{SeeCompatTable}}{{securecontext_header}}

Phương thức **`measureInputUsage()`** của giao diện {{domxref("LanguageDetector")}} báo cáo lượng hạn ngạch đầu vào sẽ được sử dụng bởi một thao tác phát hiện ngôn ngữ cho đầu vào văn bản đã cho.

## Cú pháp

```js-nolint
measureInputUsage(input)
measureInputUsage(input, options)
```

### Tham số

- `input`
  - : Một chuỗi đại diện cho văn bản đầu vào bạn muốn đo lường mức sử dụng đầu vào.
- `options` {{optional_inline}}
  - : Một đối tượng chỉ định các tùy chọn cấu hình cho thao tác `measureInputUsage()`. Các giá trị có thể bao gồm:
    - `signal`
      - : Một phiên bản đối tượng {{domxref("AbortSignal")}}, cho phép hủy bỏ thao tác `measureInputUsage()` thông qua {{domxref("AbortController")}} liên kết.

### Giá trị trả về

Một {{jsxref("Promise")}} hoàn thành với một số chỉ định mức sử dụng {{domxref("LanguageDetector.inputQuota", "inputQuota")}} của văn bản đầu vào đã cho.

Số này phụ thuộc vào triển khai; nếu nó nhỏ hơn {{domxref("LanguageDetector.inputQuota", "inputQuota")}}, ngôn ngữ của chuỗi có thể được phát hiện.

### Ngoại lệ

- `NotAllowedError` {{domxref("DOMException")}}
  - : Được ném nếu việc sử dụng API `LanguageDetector` bị chặn bởi {{httpheader('Permissions-Policy/language-detector','language-detector')}} {{httpheader("Permissions-Policy")}}.
- `UnknownError` {{domxref("DOMException")}}
  - : Được ném nếu cuộc gọi `measureInputUsage()` thất bại vì bất kỳ lý do nào khác, hoặc lý do mà tác nhân người dùng không muốn tiết lộ.

## Ví dụ

### Kiểm tra xem bạn có đủ hạn ngạch không

Trong đoạn mã dưới đây, chúng ta tạo một phiên bản `LanguageDetector` mới bằng {{domxref("LanguageDetector.create_static", "create()")}}, sau đó trả về tổng hạn ngạch đầu vào qua {{domxref("LanguageDetector.inputQuota", "inputQuota")}} và mức sử dụng hạn ngạch đầu vào để phát hiện ngôn ngữ của một chuỗi văn bản cụ thể qua `measureInputUsage()`.

Sau đó chúng ta kiểm tra xem mức sử dụng đầu vào riêng lẻ cho chuỗi đó có lớn hơn tổng hạn ngạch có sẵn không. Nếu vậy, chúng ta ném một lỗi thích hợp; nếu không, chúng ta bắt đầu phát hiện ngôn ngữ của chuỗi bằng {{domxref("LanguageDetector.detect", "detect()")}}.

```js
const detector = await LanguageDetector.create({
  expectedInputLanguages: ["en-US", "zh"],
});

const totalInputQuota = detector.inputQuota;
const inputUsage = await detector.measureInputUsage(myTextString);

if (inputUsage > totalInputQuota) {
  throw new Error("Insufficient quota to detect languages.");
} else {
  console.log("Quota available to detect languages.");
  const results = await detector.detect(myTextString);
  // ...
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Translator and Language Detector APIs](/en-US/docs/Web/API/Translator_and_Language_Detector_APIs/Using)
