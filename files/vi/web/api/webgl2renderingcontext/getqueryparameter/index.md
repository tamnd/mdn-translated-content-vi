---
title: "WebGL2RenderingContext: phương thức getQueryParameter()"
short-title: getQueryParameter()
slug: Web/API/WebGL2RenderingContext/getQueryParameter
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.getQueryParameter
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGL2RenderingContext.getQueryParameter()`** của [WebGL 2 API](/en-US/docs/Web/API/WebGL_API) trả về thông tin tham số của một đối tượng {{domxref("WebGLQuery")}}.

## Cú pháp

```js-nolint
getQueryParameter(query, pname)
```

### Tham số

- `query`
  - : Một đối tượng {{domxref("WebGLQuery")}}.
- `pname`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định thông tin nào sẽ trả về. Các giá trị có thể:
    - `gl.QUERY_RESULT`
      - : Trả về một {{domxref("WebGL_API/Types", "GLuint")}} chứa kết quả truy vấn.
    - `gl.QUERY_RESULT_AVAILABLE`
      - : Trả về một {{domxref("WebGL_API/Types", "GLboolean")}} cho biết kết quả truy vấn đã sẵn sàng hay chưa.

### Giá trị trả về

Phụ thuộc vào tham số `pname`, là một {{domxref("WebGL_API/Types", "GLuint")}} hoặc một {{domxref("WebGL_API/Types", "GLboolean")}}.

## Ví dụ

```js
const query = gl.createQuery();
gl.beginQuery(gl.ANY_SAMPLES_PASSED, query);

const result = gl.getQueryParameter(query, gl.QUERY_RESULT);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLQuery")}}