---
title: "BackgroundFetchRegistration: progress event"
short-title: progress
slug: Web/API/BackgroundFetchRegistration/progress_event
page-type: web-api-event
status:
  - experimental
browser-compat: api.BackgroundFetchRegistration.progress_event
---

{{APIRef("Background Fetch API")}}{{SeeCompatTable}}{{AvailableInWorkers}}

Sự kiện **`progress`** của giao diện {{domxref("BackgroundFetchRegistration")}} được kích hoạt khi tác vụ tìm nạp nền liên quan có tiến triển.

Trên thực tế, sự kiện này được kích hoạt khi bất kỳ thuộc tính nào sau đây trả về một giá trị mới:

- {{domxref("BackgroundFetchRegistration.uploaded", "uploaded")}},
- {{domxref("BackgroundFetchRegistration.downloaded", "downloaded")}},
- {{domxref("BackgroundFetchRegistration.result", "result")}}, hoặc
- {{domxref("BackgroundFetchRegistration.failureReason", "failureReason")}}.

## Cú pháp

Dùng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập một thuộc tính xử lý sự kiện.

```js-nolint
addEventListener("progress", (event) => { })

onprogress = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} tổng quát không có thuộc tính bổ sung nào.

## Ví dụ

Ví dụ sau minh họa cách ghi lại tiến trình của một lượt tải xuống. Trước tiên, mã sẽ kiểm tra xem `downloadTotal` đã được cung cấp khi tác vụ tìm nạp nền được đăng ký hay chưa. Giá trị này sau đó được dùng để tính phần trăm dựa trên thuộc tính `downloaded`.

```js
bgFetch.addEventListener("progress", () => {
  if (!bgFetch.downloadTotal) return;
  const percent = Math.round(
    (bgFetch.downloaded / bgFetch.downloadTotal) * 100,
  );
  console.log(`Download progress: ${percent}%`);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}
