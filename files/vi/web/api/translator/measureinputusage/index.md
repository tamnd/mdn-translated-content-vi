---
title: "Translator: measureInputUsage() method"
short-title: measureInputUsage()
slug: Web/API/Translator/measureInputUsage
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.Translator.measureInputUsage
---

{{APIRef("Translator and Language Detector APIs")}}{{SeeCompatTable}}{{securecontext_header}}

Phương thức **`measureInputUsage()`** của giao diện {{domxref("Translator")}} báo cáo mức hạn mức đầu vào sẽ được sử dụng bởi một thao tác dịch cho một văn bản đầu vào nhất định.

## Cú pháp

```js-nolint
measureInputUsage(input)
measureInputUsage(input, options)
```

### Tham số

- `input`
  - : Một chuỗi đại diện cho văn bản đầu vào mà bạn muốn đo lường mức sử dụng đầu vào.
- `options` {{optional_inline}}
  - : Một đối tượng chỉ định các tùy chọn cấu hình cho thao tác `measureInputUsage()`. Các giá trị có thể bao gồm:
    - `signal`
      - : Một đối tượng {{domxref("AbortSignal")}}, cho phép hủy thao tác `measureInputUsage()` qua {{domxref("AbortController")}} liên kết.

### Giá trị trả về

Một {{jsxref("Promise")}} thực hiện với một số chỉ định mức sử dụng {{domxref("Translator.inputQuota", "inputQuota")}} của văn bản đầu vào đã cho.

Con số này phụ thuộc vào triển khai; nếu nó nhỏ hơn {{domxref("Translator.inputQuota", "inputQuota")}}, chuỗi có thể được dịch.

### Ngoại lệ

- `NotAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu việc sử dụng Translator API bị chặn bởi {{httpheader('Permissions-Policy/translator','translator')}} {{httpheader("Permissions-Policy")}}.
- `NotReadableError` {{domxref("DOMException")}}
  - : Được ném ra nếu bản dịch đầu ra bị lọc bởi user agent, ví dụ vì nó được phát hiện là có hại, không chính xác hoặc vô nghĩa.
- `UnknownError` {{domxref("DOMException")}}
  - : Được ném ra nếu lời gọi `measureInputUsage()` thất bại vì bất kỳ lý do nào khác, hoặc vì lý do mà user agent không muốn tiết lộ.

## Ví dụ

### Kiểm tra xem bạn có đủ hạn mức không

Trong đoạn mã dưới đây, chúng ta tạo một đối tượng `Translator` mới bằng {{domxref("Translator.create_static", "create()")}}, sau đó trả về tổng hạn mức đầu vào qua {{domxref("Translator.inputQuota", "inputQuota")}} và mức sử dụng hạn mức đầu vào cho việc dịch một chuỗi văn bản cụ thể qua `measureInputUsage()`.

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
