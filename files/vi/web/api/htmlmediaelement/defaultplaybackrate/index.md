---
title: "HTMLMediaElement: thuộc tính defaultPlaybackRate"
short-title: defaultPlaybackRate
slug: Web/API/HTMLMediaElement/defaultPlaybackRate
page-type: web-api-instance-property
browser-compat: api.HTMLMediaElement.defaultPlaybackRate
---

{{APIRef("HTML DOM")}}

Thuộc tính **`HTMLMediaElement.defaultPlaybackRate`** cho biết tốc độ phát lại mặc định cho phương tiện.

## Giá trị

Một đôi. `1.0` là "tốc độ bình thường", các giá trị thấp hơn `1.0` làm cho phương tiện phát chậm hơn bình thường, giá trị cao hơn làm cho phương tiện phát nhanh hơn.

### Ngoại lệ

- `NotSupportedError` {{domxref("DOMException")}}
- : Bị ném nếu giá trị được chỉ định không được hỗ trợ.

## Ví dụ

```js
const obj = document.createElement("video");
console.log(obj.defaultPlaybackRate); // 1
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLMediaElement")}}: Giao diện dùng để định nghĩa thuộc tính `HTMLMediaElement.defaultPlaybackRate`
