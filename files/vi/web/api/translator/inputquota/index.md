---
title: "Translator: inputQuota property"
short-title: inputQuota
slug: Web/API/Translator/inputQuota
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.Translator.inputQuota
---

{{APIRef("Translator and Language Detector APIs")}}{{SeeCompatTable}}{{securecontext_header}}

Thuộc tính chỉ đọc **`inputQuota`** của giao diện {{domxref("Translator")}} trả về hạn mức đầu vào có sẵn cho trình duyệt để tạo bản dịch.

## Giá trị

Một số chỉ định hạn mức đầu vào có sẵn.

Con số này phụ thuộc vào triển khai. Ví dụ, nó có thể là {{jsxref("Infinity")}} nếu không có giới hạn ngoài bộ nhớ của người dùng và độ dài tối đa của chuỗi JavaScript, hoặc nó có thể là số token trong trường hợp các mô hình AI sử dụng sơ đồ token/credits.

Đảm bảo duy nhất là `inputQuota` - {{domxref("Translator.measureInputUsage", "measureInputUsage()")}} sẽ không âm nếu có đủ hạn mức để dịch văn bản.

## Ví dụ

### Kiểm tra xem bạn có đủ hạn mức không

Trong đoạn mã dưới đây, chúng ta tạo một đối tượng `Translator` mới bằng {{domxref("Translator.create_static", "create()")}}, sau đó trả về tổng hạn mức đầu vào qua `inputQuota` và mức sử dụng hạn mức đầu vào cho việc dịch một chuỗi văn bản cụ thể qua {{domxref("Translator.measureInputUsage", "measureInputUsage()")}}.

Sau đó chúng ta kiểm tra xem mức sử dụng đầu vào riêng lẻ cho chuỗi đó có lớn hơn tổng hạn mức có sẵn không. Nếu có, chúng ta ném ra lỗi phù hợp; nếu không, chúng ta bắt đầu dịch chuỗi bằng {{domxref("Translator.translate", "translate()")}}.

```js
const translator = await Translator.create({
  sourceLanguage: "en",
  targetLanguage: "ja",
});

const totalInputQuota = translator.inputQuota;
const inputUsage = await translator.measureInputUsage(myTextString);

if (inputUsage > totalInputQuota) {
  throw new Error("Insufficient quota to translate.");
} else {
  console.log("Quota available to translate.");
  const translation = await translator.translate(myTextString);
  // ...
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Translator và Language Detector APIs](/en-US/docs/Web/API/Translator_and_Language_Detector_APIs/Using)
