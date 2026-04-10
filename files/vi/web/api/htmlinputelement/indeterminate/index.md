---
title: "HTMLInputElement: thuộc tính indeterminate"
short-title: indeterminate
slug: Web/API/HTMLInputElement/indeterminate
page-type: web-api-instance-property
browser-compat: api.HTMLInputElement.indeterminate
---

{{APIRef("HTML DOM")}}

Thuộc tính **`indeterminate`** của giao diện {{domxref("HTMLInputElement")}} trả về một giá trị boolean cho biết liệu hộp kiểm có ở trạng thái _không xác định_ hay không. Ví dụ: hộp kiểm "chọn tất cả/bỏ chọn tất cả" có thể ở trạng thái không xác định khi một số nhưng không phải tất cả các điều khiển con của nó được chọn. Trạng thái `indeterminate` chỉ có thể được đặt qua JavaScript và chỉ liên quan đến các điều khiển [`checkbox`](/en-US/docs/Web/HTML/Reference/Elements/input/checkbox).

Nó không liên quan đến thuộc tính {{domxref("HTMLInputElement.checked")}}, và một hộp kiểm không xác định có thể được chọn hoặc không được chọn. Việc không xác định chỉ ảnh hưởng đến giao diện của hộp kiểm (xem ví dụ dưới đây), không ảnh hưởng đến sự hiện diện của nó khi gửi (được kiểm soát bởi trạng thái được chọn).

## Giá trị

Một boolean.

## Ví dụ

```html
<input type="checkbox" id="indeterminate-checkbox" />
<label for="indeterminate-checkbox">Hộp kiểm không xác định</label>
```

```js
const checkbox = document.getElementById("indeterminate-checkbox");
checkbox.indeterminate = true;
```

{{EmbedLiveSample("examples", "", 200)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLInputElement")}}
- {{domxref("HTMLInputElement.checked")}}
- {{HTMLElement("input")}}
- [Hộp kiểm trạng thái không xác định](/en-US/docs/Web/HTML/Reference/Elements/input/checkbox#indeterminate_state_checkboxes)
- Thuộc tính CSS {{cssxref(":indeterminate")}}
