---
title: "LanguageDetector: phương thức detect()"
short-title: detect()
slug: Web/API/LanguageDetector/detect
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.LanguageDetector.detect
---

{{APIRef("Translator and Language Detector APIs")}}{{SeeCompatTable}}{{securecontext_header}}

Phương thức **`detect()`** của giao diện {{domxref("LanguageDetector")}} phát hiện ngôn ngữ khớp gần nhất hoặc các ngôn ngữ mà một chuỗi văn bản đã cho có nhiều khả năng được viết.

## Cú pháp

```js-nolint
detect(input)
detect(input, options)
```

### Tham số

- `input`
  - : Một chuỗi đại diện cho văn bản cần phát hiện ngôn ngữ.
- `options` {{optional_inline}}
  - : Một đối tượng chỉ định các tùy chọn cấu hình cho thao tác `detect()`. Các giá trị có thể bao gồm:
    - `signal`
      - : Một phiên bản đối tượng {{domxref("AbortSignal")}}, cho phép hủy bỏ thao tác `detect()` thông qua {{domxref("AbortController")}} liên kết.

### Giá trị trả về

Một {{jsxref("Promise")}} hoàn thành với một mảng các đối tượng đại diện cho các ngôn ngữ được phát hiện. Mỗi đối tượng chứa các thuộc tính sau:

- `detectedLanguage`
  - : Một {{glossary("BCP 47 language tag")}} đại diện cho ngôn ngữ được phát hiện.
- `confidence`
  - : Một số trong khoảng từ `0` đến `1` đại diện cho độ tin cậy của mô hình AI rằng ngôn ngữ được phát hiện là đúng.

Tổng của tất cả các giá trị `confidence` được trả về về lý thuyết nên bằng 1, tuy nhiên, nó có thể thấp hơn vì các giá trị độ tin cậy rất thấp bị loại trừ khỏi kết quả.

Phần tử mảng cuối cùng được trả về sẽ luôn có giá trị `detectedLanguage` là `und` - đây là viết tắt của "undetermined" (không xác định), và đại diện cho xác suất văn bản không được viết bằng ngôn ngữ mà mô hình biết.

### Ngoại lệ

- `AbortError` {{domxref("DOMException")}}
  - : Được ném nếu `LanguageDetector` đã bị hủy trước đó (đã gọi {{domxref("LanguageDetector.destroy()")}} trên nó, hoặc bị hủy bỏ qua [`signal`](/en-US/docs/Web/API/LanguageDetector/create_static#signal) hủy bỏ của nó sau khi tạo).
- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném nếu {{domxref("Document")}} hiện tại không hoạt động.
- {{domxref("QuotaExceededError")}}
  - : Được ném nếu thao tác phát hiện ngôn ngữ vượt quá {{domxref("LanguageDetector.inputQuota", "inputQuota")}} có sẵn.

## Ví dụ

### Sử dụng cơ bản `detect()`

```js
const detector = await LanguageDetector.create({
  expectedInputLanguages: ["en-US", "zh"],
});

const results = await detector.detect(myTextString);

results.forEach((result) => {
  console.log(`${result.detectedLanguage}: ${result.confidence}`);
});

// Results in logs like this:
// la: 0.8359838724136353
// es: 0.017705978825688362
// sv: 0.012977192178368568
// en: 0.011148443445563316
// und: 0.0003214875760022551
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Translator and Language Detector APIs](/en-US/docs/Web/API/Translator_and_Language_Detector_APIs/Using)
