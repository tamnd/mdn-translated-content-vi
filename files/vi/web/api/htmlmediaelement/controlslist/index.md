---
title: "HTMLMediaElement: thuộc tính controlsList"
short-title: controlsList
slug: Web/API/HTMLMediaElement/controlsList
page-type: web-api-instance-property
browser-compat: api.HTMLMediaElement.controlsList
---

{{APIRef("HTML DOM")}}

Thuộc tính **`controlsList`** của
Giao diện {{domxref("HTMLMediaElement")}} trả về DOMTokenList giúp người dùng
tác nhân chọn điều khiển nào sẽ hiển thị trên phần tử phương tiện bất cứ khi nào tác nhân người dùng hiển thị
bộ điều khiển riêng của nó. DOMTokenList nhận một hoặc nhiều hơn trong số ba giá trị có thể có:
`nodownload`, `nofullscreen` và `noremoteplayback`.

## Giá trị

Một {{domxref("DOMTokenList")}}.

Giá trị của `controlsList` có thể được đặt bằng cách truyền một chuỗi đại diện cho thuộc tính {{domxref("DOMTokenList/value", "value")}} của `DOMTokenList`.

## Ví dụ

### Lấy thuộc tính controlList

Thuộc tính `controlsList` trả về đối tượng {{domxref("DOMTokenList")}} chứa giá trị được đặt hiện tại.

```js
const video = document.createElement("video");
console.log(video.controlsList.value); // ""

video.controlsList.add("noremoteplayback");
console.log(video.controlsList.value); // "noremoteplayback"
```

### Đặt thuộc tính controlList

Bạn cũng có thể sửa đổi `controlsList` bằng cách trực tiếp đặt nó thành một chuỗi chứa giá trị mới.

```js
const audio = document.createElement("audio");
audio.controlsList = "nodownload";
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Chrome HTMLMediaElement controlsList Sample](https://googlechrome.github.io/samples/media/controlslist.html)
