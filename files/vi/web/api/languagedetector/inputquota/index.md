---
title: "LanguageDetector: thuộc tính inputQuota"
short-title: inputQuota
slug: Web/API/LanguageDetector/inputQuota
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.LanguageDetector.inputQuota
---

{{APIRef("Translator and Language Detector APIs")}}{{SeeCompatTable}}{{securecontext_header}}

Thuộc tính chỉ đọc **`inputQuota`** của giao diện {{domxref("LanguageDetector")}} trả về hạn ngạch đầu vào có sẵn cho trình duyệt để phát hiện ngôn ngữ.

## Giá trị

Một số chỉ định hạn ngạch đầu vào có sẵn.

Số này phụ thuộc vào triển khai. Ví dụ, nó có thể là {{jsxref("Infinity")}} nếu không có giới hạn nào ngoài bộ nhớ của người dùng và độ dài tối đa của chuỗi JavaScript, hoặc nó có thể là số token trong trường hợp các mô hình AI sử dụng cơ chế token/credit.

Đảm bảo duy nhất là `inputQuota` - {{domxref("LanguageDetector.measureInputUsage", "measureInputUsage()")}} sẽ không âm nếu có đủ hạn ngạch để phát hiện ngôn ngữ của văn bản.

## Ví dụ

### Kiểm tra xem bạn có đủ hạn ngạch không

Trong đoạn mã dưới đây, chúng ta tạo một phiên bản `LanguageDetector` mới bằng {{domxref("LanguageDetector.create_static", "create()")}}, sau đó trả về tổng hạn ngạch đầu vào qua `inputQuota` và mức sử dụng hạn ngạch đầu vào để phát hiện ngôn ngữ của một chuỗi văn bản cụ thể qua {{domxref("LanguageDetector.measureInputUsage", "measureInputUsage()")}}.

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
