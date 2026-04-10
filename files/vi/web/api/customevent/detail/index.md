---
title: "CustomEvent: thuộc tính detail"
short-title: detail
slug: Web/API/CustomEvent/detail
page-type: web-api-instance-property
browser-compat: api.CustomEvent.detail
---

{{APIRef("DOM")}}{{AvailableInWorkers}}

Thuộc tính **`detail`** chỉ đọc của giao diện {{domxref("CustomEvent")}} trả về bất kỳ dữ liệu nào được truyền khi khởi tạo sự kiện.

## Giá trị

Bất kỳ dữ liệu nào mà sự kiện được khởi tạo với nó.

## Ví dụ

```js
// tạo các sự kiện tùy chỉnh
const catFound = new CustomEvent("animalfound", {
  detail: {
    name: "cat",
  },
});
const dogFound = new CustomEvent("animalfound", {
  detail: {
    name: "dog",
  },
});

const element = document.createElement("div"); // tạo một phần tử <div>

// thêm trình lắng nghe sự kiện phù hợp
element.addEventListener("animalfound", (e) => console.log(e.detail.name));

// dispatch các sự kiện
element.dispatchEvent(catFound);
element.dispatchEvent(dogFound);

// "cat" và "dog" được ghi ra console
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("CustomEvent")}}
