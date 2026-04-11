---
title: "MouseEvent: layerX property"
short-title: layerX
slug: Web/API/MouseEvent/layerX
page-type: web-api-instance-property
status:
  - non-standard
browser-compat: api.MouseEvent.layerX
---

{{APIRef("Pointer Events")}}{{Non-standard_Header}}

Thuộc tính **`MouseEvent.layerX`** chỉ đọc trả về
tọa độ ngang của sự kiện so với lớp hiện tại.

Thuộc tính này tính đến việc cuộn trang và trả về một giá trị tương ứng với
toàn bộ tài liệu trừ khi sự kiện xảy ra bên trong một phần tử được định vị, trong đó
giá trị trả về tương ứng với phía trên bên trái của phần tử được định vị.

## Giá trị

Một giá trị số nguyên tính bằng pixel cho tọa độ x của con trỏ chuột khi sự kiện chuột được kích hoạt.

## Ví dụ

```html
<p>To display the mouse coordinates please click anywhere on the page.</p>

<div id="d1">
  <span>
    This is an un-positioned div so clicking it will return layerX/layerY values
    almost the same as pageX/PageY values.
  </span>
</div>

<div id="d2">
  <span>
    This is a positioned div so clicking it will return layerX/layerY values
    that are relative to the top-left corner of this positioned element. Note
    the pageX\pageY properties still return the absolute position in the
    document, including page scrolling.
  </span>

  <span>
    Make the page scroll more! This is a positioned div so clicking it will
    return layerX/layerY values that are relative to the top-left corner of this
    positioned element. Note the pageX\pageY properties still return the
    absolute position in the document, including page scrolling.
  </span>
</div>

<div id="d3">
  <form name="form_coords" id="form1">
    Parent Element id: <input type="text" name="parentId" size="7" /><br />
    pageX: <input type="text" name="pageXCoords" size="7" /> pageY:
    <input type="text" name="pageYCoords" size="7" /><br />
    layerX: <input type="text" name="layerXCoords" size="7" /> layerY:
    <input type="text" name="layerYCoords" size="7" />
  </form>
</div>
```

```css
#d1 {
  border: solid blue 1px;
  padding: 20px;
}

#d2 {
  position: absolute;
  top: 180px;
  left: 80%;
  right: auto;
  width: 40%;
  border: solid blue 1px;
  padding: 20px;
}

#d3 {
  position: absolute;
  top: 240px;
  left: 20%;
  width: 50%;
  border: solid blue 1px;
  padding: 10px;
}
```

```js
function showCoords(evt) {
  const form = document.forms.form_coords;
  const parentId = evt.target.parentNode.id;
  form.parentId.value = parentId;
  form.pageXCoords.value = evt.pageX;
  form.pageYCoords.value = evt.pageY;
  form.layerXCoords.value = evt.layerX;
  form.layerYCoords.value = evt.layerY;
}

window.addEventListener("mousedown", showCoords);
```

## Thông số kỹ thuật

_Thuộc tính này không phải là một phần của bất kỳ thông số kỹ thuật nào._

## Khả năng tương thích của trình duyệt

{{Compat}}
