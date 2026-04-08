---
title: Testing media queries programmatically
short-title: Testing
slug: Web/CSS/Guides/Media_queries/Testing
page-type: guide
browser-compat: api.MediaQueryList
sidebar: cssref
---

{{Glossary("DOM")}} cung cấp các tính năng có thể kiểm tra kết quả của một {{Glossary("media query")}} theo chương trình, thông qua interface {{domxref("MediaQueryList")}} và các phương thức, thuộc tính của nó. Sau khi bạn đã tạo đối tượng `MediaQueryList`, bạn có thể kiểm tra kết quả của [query](/en-US/docs/Web/CSS/Guides/Media_queries/Using) hoặc nhận thông báo khi kết quả thay đổi.

## Tạo danh sách media query

Trước khi bạn có thể đánh giá kết quả của một media query, bạn cần tạo đối tượng {{domxref("MediaQueryList")}} đại diện cho query. Để làm điều này, sử dụng phương thức {{domxref("window.matchMedia")}}.

Ví dụ, để thiết lập một danh sách query xác định xem thiết bị ở chế độ ngang hay dọc [orientation](/en-US/docs/Web/CSS/Reference/At-rules/@media/orientation):

```js
const mediaQueryList = window.matchMedia("(orientation: portrait)");
```

## Kiểm tra kết quả của một query

Sau khi bạn đã tạo danh sách media query, bạn có thể kiểm tra kết quả của query bằng cách xem giá trị của thuộc tính [`matches`](/en-US/docs/Web/API/MediaQueryList/matches) của nó:

```js
if (mediaQueryList.matches) {
  /* The viewport is currently in portrait orientation */
} else {
  /* The viewport is not currently in portrait orientation, therefore landscape */
}
```

## Nhận thông báo query

Nếu bạn cần biết về các thay đổi đối với kết quả đã đánh giá của query một cách liên tục, sẽ hiệu quả hơn khi đăng ký một [listener](/en-US/docs/Web/API/EventTarget/addEventListener) thay vì thăm dò kết quả của query. Để làm điều này, gọi phương thức {{domxref("EventTarget.addEventListener", "addEventListener()")}} trên đối tượng {{domxref("MediaQueryList")}}, với một hàm callback để gọi khi trạng thái media query thay đổi (ví dụ: khi bài kiểm tra media query chuyển từ `true` sang `false`):

```js
// Create the query list.
const mediaQueryList = window.matchMedia("(orientation: portrait)");

// Define a callback function for the event listener.
function handleOrientationChange(mql) {
  // …
}

// Run the orientation change handler once.
handleOrientationChange(mediaQueryList);

// Add the callback function as a listener to the query list.
mediaQueryList.addEventListener("change", handleOrientationChange);
```

Đoạn code này tạo danh sách media query kiểm tra orientation và thêm event listener vào nó. Sau khi xác định listener, chúng ta cũng gọi listener trực tiếp. Điều này làm cho listener của chúng ta thực hiện các điều chỉnh dựa trên orientation thiết bị hiện tại; nếu không, code của chúng ta có thể giả định thiết bị ở chế độ dọc lúc khởi động, ngay cả khi thực tế ở chế độ ngang.

Hàm `handleOrientationChange()` sẽ xem xét kết quả của query và xử lý bất cứ điều gì chúng ta cần làm khi orientation thay đổi:

```js
function handleOrientationChange(evt) {
  if (evt.matches) {
    /* The viewport is currently in portrait orientation */
  } else {
    /* The viewport is currently in landscape orientation */
  }
}
```

Ở trên, chúng ta xác định tham số là `evt` — một đối tượng sự kiện kiểu {{domxref("MediaQueryListEvent")}} cũng bao gồm các thuộc tính {{domxref("MediaQueryListEvent.media","media")}} và {{domxref("MediaQueryListEvent.matches","matches")}}, vì vậy bạn có thể truy vấn các tính năng này của `MediaQueryList` bằng cách truy cập trực tiếp hoặc truy cập đối tượng sự kiện.

## Kết thúc thông báo query

Để ngừng nhận thông báo về các thay đổi đối với giá trị của media query, gọi {{domxref("EventTarget.removeEventListener", "removeEventListener()")}} trên `MediaQueryList`, truyền vào tên của hàm callback đã được xác định trước đó:

```js
mediaQueryList.removeEventListener("change", handleOrientationChange);
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Media queries](/en-US/docs/Web/CSS/Guides/Media_queries/Using)
- Module [CSS media queries](/en-US/docs/Web/CSS/Guides/Media_queries)
- Module [CSS object model](/en-US/docs/Web/API/CSS_Object_Model)
- {{domxref("window.matchMedia()")}}
- {{domxref("MediaQueryList")}}
- {{domxref("MediaQueryListEvent")}}
