---
title: "HTMLCanvasElement: height property"
short-title: height
slug: Web/API/HTMLCanvasElement/height
page-type: web-api-instance-property
browser-compat: api.HTMLCanvasElement.height
---

{{APIRef("Canvas API")}}

Thuộc tính **`HTMLCanvasElement.height`** là một số nguyên dương phản ánh thuộc tính HTML [`height`](/en-US/docs/Web/HTML/Reference/Elements/canvas#height) của phần tử {{HTMLElement("canvas")}} khi được hiểu theo CSS pixel. Khi thuộc tính không được chỉ định, hoặc được đặt thành giá trị không hợp lệ như số âm, giá trị mặc định `150` sẽ được dùng.

Việc đặt thuộc tính `height` sẽ đặt lại toàn bộ rendering context về trạng thái mặc định. Điều này bao gồm xóa canvas, đặt lại đường dẫn hiện tại, và đặt lại _mọi_ thuộc tính như `fillStyle` và `globalCompositeOperation`.
