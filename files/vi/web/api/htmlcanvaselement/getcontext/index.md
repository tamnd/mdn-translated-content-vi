---
title: "HTMLCanvasElement: getContext() method"
short-title: getContext()
slug: Web/API/HTMLCanvasElement/getContext
page-type: web-api-instance-method
browser-compat: api.HTMLCanvasElement.getContext
---

{{APIRef("Canvas API")}}

**`HTMLCanvasElement.getContext()`** trả về một context vẽ trên canvas, hoặc [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) nếu mã định danh context không được hỗ trợ, hoặc canvas đã được đặt sang một chế độ context khác.

Các lần gọi sau trên cùng phần tử canvas, với cùng đối số `contextType`, sẽ luôn trả về cùng một instance context như lần gọi đầu tiên.
