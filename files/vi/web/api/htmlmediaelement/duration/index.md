---
title: "HTMLMediaElement: thuộc tính duration"
short-title: duration
slug: Web/API/HTMLMediaElement/duration
page-type: web-api-instance-property
browser-compat: api.HTMLMediaElement.duration
---

{{APIRef("HTML DOM")}}

_chỉ đọc_ {{domxref("HTMLMediaElement")}}
thuộc tính **`duration`** cho biết độ dài của phần tử
phương tiện truyền thông trong vài giây.

## Giá trị

Giá trị dấu phẩy động có độ chính xác kép cho biết thời lượng của phương tiện trong
giây. Nếu không có dữ liệu đa phương tiện, giá trị `NaN` sẽ được trả về. Nếu
phương tiện của phần tử không có thời lượng xác định—chẳng hạn như đối với luồng phương tiện trực tiếp—giá trị
của `duration` là `Infinity`.

## Ví dụ

```js
const obj = document.createElement("video");
console.log(obj.duration); // NaN
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web media technologies](/en-US/docs/Web/Media)
- {{domxref("HTMLMediaElement.currentTime")}}: Vị trí phát lại hiện tại của
  phương tiện truyền thông
- Các phần tử {{HTMLElement("audio")}} và {{HTMLElement("video")}}
