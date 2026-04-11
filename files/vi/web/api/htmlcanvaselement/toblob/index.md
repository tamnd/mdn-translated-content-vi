---
title: "HTMLCanvasElement: toBlob() method"
short-title: toBlob()
slug: Web/API/HTMLCanvasElement/toBlob
page-type: web-api-instance-method
browser-compat: api.HTMLCanvasElement.toBlob
---

{{APIRef("Canvas API")}}

**`HTMLCanvasElement.toBlob()`** tạo một đối tượng {{domxref("Blob")}} biểu diễn hình ảnh chứa trong canvas. Tệp này có thể được lưu trên đĩa hoặc trong bộ nhớ tùy theo user agent.

Định dạng tệp và chất lượng ảnh có thể được chỉ định. Nếu không chỉ định định dạng, hoặc định dạng đó không được hỗ trợ, dữ liệu sẽ được xuất dưới dạng `image/png`.
