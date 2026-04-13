---
title: "LanguageDetector: phương thức tĩnh availability()"
short-title: availability()
slug: Web/API/LanguageDetector/availability_static
page-type: web-api-static-method
status:
  - experimental
browser-compat: api.LanguageDetector.availability_static
---

{{APIRef("Translator and Language Detector APIs")}}{{SeeCompatTable}}{{securecontext_header}}

Phương thức tĩnh **`availability()`** của giao diện {{domxref("LanguageDetector")}} trả về giá trị kiểu liệt kê cho biết liệu mô hình AI của trình duyệt có hỗ trợ cấu hình `LanguageDetector` đã cho hay không.

## Cú pháp

```js-nolint
LanguageDetector.availability(options)
```

### Tham số

- `options`
  - : Một đối tượng chỉ định các tùy chọn cấu hình cho `LanguageDetector`. Các giá trị có thể bao gồm:
    - `expectedInputLanguages`
      - : Một mảng các chuỗi chỉ định các ngôn ngữ dự kiến của văn bản đầu vào cần phát hiện ngôn ngữ. Đây phải là các thẻ ngôn ngữ {{glossary("BCP 47 language tag", "BCP 47")}} hợp lệ. Mặc định là `["en"]`

### Giá trị trả về

Một {{jsxref("Promise")}} hoàn thành với giá trị kiểu liệt kê cho biết liệu hỗ trợ có sẵn (hoặc sẽ có sẵn) cho cấu hình `LanguageDetector` đã cho, hoặc `null` nếu không thể xác định hỗ trợ.

Các giá trị có thể bao gồm:

- `available`
  - : Trình duyệt hỗ trợ cấu hình đã cho và có thể sử dụng ngay lập tức.
- `downloadable`
  - : Trình duyệt hỗ trợ cấu hình đã cho, nhưng trước tiên cần tải xuống mô hình AI hoặc một số dữ liệu tinh chỉnh cho mô hình.
- `downloading`
  - : Trình duyệt hỗ trợ cấu hình đã cho, nhưng phải hoàn thành một lần tải xuống đang diễn ra trước khi có thể tiến hành.
- `unavailable`
  - : Trình duyệt không hỗ trợ cấu hình đã cho.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném nếu {{domxref("Document")}} của trang chưa hoạt động.
- `OperationError` {{domxref("DOMException")}}
  - : Được ném nếu việc khởi tạo mô hình AI thất bại vì bất kỳ lý do nào.
- `UnknownError` {{domxref("DOMException")}}
  - : Được ném nếu cuộc gọi `availability()` thất bại vì bất kỳ lý do nào khác, hoặc lý do mà tác nhân người dùng không muốn tiết lộ.

Nếu việc sử dụng phương thức bị chặn bởi {{httpheader('Permissions-Policy/language-detector','language-detector')}} {{httpheader("Permissions-Policy")}}, promise từ chối với giá trị `unavailable`.

## Ví dụ

### Sử dụng cơ bản `availability()`

Trong đoạn mã sau, chúng ta bắt đầu bằng cách kiểm tra tính khả dụng của mô hình để phát hiện một số ngôn ngữ bằng phương thức `availability()`:

- Nếu nó trả về `unavailable`, chúng ta in thông báo lỗi thích hợp ra console.
- Nếu nó trả về `available`, chúng ta tạo trình phát hiện ngôn ngữ bằng phương thức {{domxref("LanguageDetector.create_static", "create()")}}, truyền cho nó `expectedInputLanguages`. Mô hình AI cần thiết có sẵn, vì vậy chúng ta có thể sử dụng ngay.
- Nếu nó trả về giá trị khác (tức là `downloadable` hoặc `downloading`), chúng ta chạy cùng lệnh gọi `create()`, nhưng lần này chúng ta bao gồm `monitor` ghi lại phần trăm mô hình đã tải xuống mỗi khi sự kiện {{domxref("CreateMonitor/downloadprogress_event", "downloadprogress")}} kích hoạt.

```js
async function getDetector(languages) {
  const availability = await LanguageDetector.availability({
    expectedInputLanguages: languages,
  });
  if (availability === "unavailable") {
    console.log(`Detection not supported; try a different set of languages.`);
    return undefined;
  } else if (availability === "available") {
    return await LanguageDetector.create({
      expectedInputLanguages: languages,
    });
  }
  return await LanguageDetector.create({
    expectedInputLanguages: languages,
    monitor(monitor) {
      monitor.addEventListener("downloadprogress", (e) => {
        console.log(`Downloaded ${Math.floor(e.loaded * 100)}%`);
      });
    },
  });
}

const detector = await getDetector(["en-US", "zh"]);
```

### Phát hiện hỗ trợ ngôn ngữ

```js
async function langSupport(language) {
  const availability = await LanguageDetector.availability({
    expectedInputLanguages: [language],
  });
  return availability;
}

await langSupport("en");
await langSupport("pt");
await langSupport("zh");
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Translator and Language Detector APIs](/en-US/docs/Web/API/Translator_and_Language_Detector_APIs/Using)
