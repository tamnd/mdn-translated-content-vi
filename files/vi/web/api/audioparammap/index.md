---
title: AudioParamMap
slug: Web/API/AudioParamMap
page-type: web-api-interface
browser-compat: api.AudioParamMap
---

{{APIRef("Web Audio API")}}

Giao diện **`AudioParamMap`** của [Web Audio API](/en-US/docs/Web/API/Web_Audio_API) biểu diễn một tập hợp nhiều tham số âm thanh có thể lặp và chỉ đọc.

Một thể hiện `AudioParamMap` là một [đối tượng giống `Map` chỉ đọc](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map#map-like_browser_apis), trong đó mỗi khóa là chuỗi tên của một tham số, và giá trị tương ứng là một {{domxref("AudioParam")}} chứa giá trị của tham số đó.

## Thuộc tính thể hiện

Các phương thức sau có sẵn cho mọi [đối tượng giống `Map` chỉ đọc](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map#map-like_browser_apis) (các liên kết bên dưới trỏ đến trang tham chiếu của đối tượng toàn cục {{jsxref("Map")}}).

- {{jsxref("Map/size", "size")}}
  - : Trả về số lượng mục trong map.

## Phương thức thể hiện

Các phương thức sau có sẵn cho mọi [đối tượng giống `Map` chỉ đọc](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map#map-like_browser_apis) (các liên kết bên dưới trỏ đến trang tham chiếu của đối tượng toàn cục {{jsxref("Map")}}).

- {{jsxref("Map/entries", "entries()")}}
  - : Trả về một [đối tượng iterator](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator) mới, đối tượng này cho ra các mục trong map dưới dạng cặp `[key, value]` theo thứ tự chèn.
- {{jsxref("Map/forEach", "forEach()")}}
  - : Gọi {{glossary("callback function")}} được cung cấp một lần cho mỗi giá trị và khóa có trong map, theo thứ tự chèn.
- {{jsxref("Map/get", "get()")}}
  - : Trả về giá trị {{domxref("AudioParam")}} được liên kết với khóa chuỗi, hoặc `undefined` nếu không có.
- {{jsxref("Map/has", "has()")}}
  - : Trả về một [boolean](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Boolean) cho biết khóa có hiện diện trong map hay không.
- {{jsxref("Map/keys", "keys()")}}
  - : Trả về một đối tượng iterator mới, đối tượng này cho ra các khóa chuỗi trong map theo thứ tự chèn.
- {{jsxref("Map/values", "values()")}}
  - : Trả về một đối tượng iterator mới, đối tượng này cho ra các giá trị {{domxref("AudioParam")}} trong map theo thứ tự chèn.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
