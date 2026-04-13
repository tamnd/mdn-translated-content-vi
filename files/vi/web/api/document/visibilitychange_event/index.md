---
title: "Document: visibilitychange event"
short-title: visibilitychange
slug: Web/API/Document/visibilitychange_event
page-type: web-api-event
browser-compat: api.Document.visibilitychange_event
---

{{APIRef}}

Sự kiện `visibilitychange` được kích hoạt tại tài liệu khi trạng thái hiển thị của nó thay đổi — ví dụ: khi người dùng chuyển tab trình duyệt, điều hướng đến trang mới, thu nhỏ hoặc đóng trình duyệt, hoặc trên di động, chuyển sang ứng dụng khác.

Sự kiện này không thể hủy.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("visibilitychange", (event) => { })

onvisibilitychange = (event) => { }
```

## Loại sự kiện

Một {{domxref("Event")}} chung.

## Ghi chú sử dụng

Sự kiện không bao gồm trạng thái hiển thị đã cập nhật của tài liệu, nhưng bạn có thể lấy thông tin đó từ thuộc tính {{domxref("Document.visibilityState", "visibilityState")}} của tài liệu.

Sự kiện này được kích hoạt với `visibilityState` là `hidden` khi người dùng điều hướng đến trang mới, chuyển tab, đóng tab, thu nhỏ hoặc đóng trình duyệt, hoặc trên di động, chuyển từ trình duyệt sang ứng dụng khác. Chuyển đổi sang `hidden` là sự kiện cuối cùng có thể quan sát reliably bởi trang, do đó các nhà phát triển nên coi nó như là điểm kết thúc có thể xảy ra của phiên người dùng (ví dụ: để [gửi dữ liệu phân tích](/en-US/docs/Web/API/Navigator/sendBeacon)).

Quá trình chuyển đổi sang `hidden` cũng là thời điểm tốt để các trang có thể dừng cập nhật UI và dừng bất kỳ tác vụ nào mà người dùng không muốn chạy nền.

## Ví dụ

### Tạm dừng nhạc khi chuyển sang hidden

Ví dụ này tạm dừng phát âm thanh khi trang bị ẩn và tiếp tục phát khi trang trở nên hiển thị lại.
Để biết ví dụ đầy đủ, xem tài liệu [Page Visibility API: Pausing audio on page hide](/en-US/docs/Web/API/Page_Visibility_API#pausing_audio_on_page_hide).

```js
document.addEventListener("visibilitychange", () => {
  if (document.hidden) {
    playingOnHide = !audio.paused;
    audio.pause();
  } else if (playingOnHide) {
    // Tiếp tục phát nếu âm thanh đang "phát khi ẩn"
    audio.play();
  }
});
```

### Gửi phân tích cuối phiên khi chuyển sang hidden

Ví dụ này coi quá trình chuyển đổi sang `hidden` là điểm kết thúc của phiên người dùng và gửi dữ liệu phân tích phù hợp bằng API {{domxref("Navigator.sendBeacon()")}}:

```js
document.onvisibilitychange = () => {
  if (document.visibilityState === "hidden") {
    navigator.sendBeacon("/log", analyticsData);
  }
};
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Page Visibility API](/en-US/docs/Web/API/Page_Visibility_API)
- {{domxref("Document.visibilityState")}}
- {{domxref("Document.hidden")}}
- [Don't lose user and app state, use Page Visibility](https://www.igvita.com/2015/11/20/dont-lose-user-and-app-state-use-page-visibility/) giải thích chi tiết tại sao bạn nên sử dụng `visibilitychange`, không phải `beforeunload`/`unload`.
- [Page Lifecycle API](https://developer.chrome.com/docs/web-platform/page-lifecycle-api) đưa ra hướng dẫn thực hành tốt nhất về cách xử lý hành vi vòng đời trang trong các ứng dụng web của bạn.
