---
title: "Translator: availability() static method"
short-title: availability()
slug: Web/API/Translator/availability_static
page-type: web-api-static-method
status:
  - experimental
browser-compat: api.Translator.availability_static
---

{{APIRef("Translator and Language Detector APIs")}}{{SeeCompatTable}}{{securecontext_header}}

Phương thức tĩnh **`availability()`** của giao diện {{domxref("Translator")}} trả về một giá trị liệt kê cho biết tính khả dụng của mô hình AI cho cấu hình `Translator` đã cho.

## Cú pháp

```js-nolint
Translator.availability(options)
```

### Tham số

- `options`
  - : Một đối tượng chỉ định các tùy chọn cấu hình cho `Translator`. Các giá trị có thể bao gồm:
    - `sourceLanguage`
      - : Một chuỗi chỉ định ngôn ngữ của văn bản đầu vào cần dịch, phải là {{glossary("BCP 47 language tag")}} hợp lệ.
    - `targetLanguage`
      - : Một chuỗi chỉ định ngôn ngữ mà văn bản đầu vào sẽ được dịch sang, phải là BCP 47 language tag hợp lệ.

### Giá trị trả về

Một {{jsxref("Promise")}} thực hiện với một giá trị liệt kê cho biết liệu có hỗ trợ (hoặc sẽ có) cho một cấu hình `Translator` nhất định hay không, hoặc `null` nếu không thể xác định hỗ trợ.

Các giá trị có thể bao gồm:

- `available`
  - : Trình duyệt hỗ trợ cấu hình đã cho và có thể được sử dụng ngay lập tức.
- `downloadable`
  - : Trình duyệt hỗ trợ cấu hình đã cho, nhưng trước tiên cần tải xuống mô hình AI hoặc một số dữ liệu tinh chỉnh cho mô hình.
- `downloading`
  - : Trình duyệt hỗ trợ cấu hình đã cho, nhưng cần hoàn thành quá trình tải xuống đang diễn ra trước khi có thể tiến hành.
- `unavailable`
  - : Trình duyệt không hỗ trợ cấu hình đã cho. Giá trị này cũng được trả về nếu `sourceLanguage` và `targetLanguage` được chỉ định giống nhau.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu {{domxref("Document")}} của trang chưa hoạt động.
- `OperationError` {{domxref("DOMException")}}
  - : Được ném ra nếu khởi tạo mô hình AI thất bại vì bất kỳ lý do nào.
- `UnknownError` {{domxref("DOMException")}}
  - : Được ném ra nếu lời gọi `availability()` thất bại vì bất kỳ lý do nào khác, hoặc vì lý do mà user agent không muốn tiết lộ.

Nếu việc sử dụng phương thức bị chặn bởi {{httpheader('Permissions-Policy/translator','translator')}} {{httpheader("Permissions-Policy")}}, promise từ chối với giá trị `unavailable`.

## Ví dụ

### Sử dụng cơ bản `availability()`

Trong đoạn mã sau, chúng ta bắt đầu bằng cách kiểm tra tính khả dụng của mô hình để dịch giữa hai ngôn ngữ bằng phương thức `availability()`:

- Nếu trả về `unavailable`, chúng ta in thông báo lỗi phù hợp ra console.
- Nếu trả về `available`, chúng ta tạo translator bằng phương thức {{domxref("Translator.create_static", "create()")}}, truyền ngôn ngữ nguồn và đích. Mô hình AI bắt buộc đã có sẵn, vì vậy chúng ta có thể sử dụng ngay.
- Nếu trả về giá trị khác (tức là `downloadable` hoặc `downloading`), chúng ta chạy cùng lời gọi `create()`, nhưng lần này chúng ta bao gồm `monitor` để ghi lại phần trăm mô hình đã tải xuống mỗi khi sự kiện {{domxref("CreateMonitor/downloadprogress_event", "downloadprogress")}} kích hoạt.

```js
async function getTranslator(languages) {
  const availability = await Translator.availability(languages);

  if (availability === "unavailable") {
    console.log(
      `Translation not supported; try a different language combination.`,
    );
    return undefined;
  } else if (availability === "available") {
    return await Translator.create(languages);
  }
  return await Translator.create({
    ...languages,
    monitor(monitor) {
      monitor.addEventListener("downloadprogress", (e) => {
        console.log(`Downloaded ${Math.floor(e.loaded * 100)}%`);
      });
    },
  });
}

const translator = await getTranslator({
  sourceLanguage: "en",
  targetLanguage: "ja",
});
```

### Phát hiện hỗ trợ ngôn ngữ

```js
async function langSupport(source, target) {
  const availability = await Translator.availability({
    sourceLanguage: source,
    targetLanguage: target,
  });
  return availability;
}

await langSupport("en", "fr");
await langSupport("en", "pt");
await langSupport("en", "zh");
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Translator và Language Detector APIs](/en-US/docs/Web/API/Translator_and_Language_Detector_APIs/Using)
