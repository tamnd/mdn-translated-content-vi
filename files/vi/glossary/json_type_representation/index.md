---
title: JSON type representation
slug: Glossary/JSON_type_representation
page-type: glossary-definition
sidebar: glossarysidebar
---

{{glossary("JSON")}} là một định dạng thuận tiện và được sử dụng rộng rãi để tuần tự hóa các đối tượng, mảng, số, chuỗi, boolean và null.
[JSON không hỗ trợ tất cả các kiểu dữ liệu được phép trong JavaScript](/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON#javascript_and_json_differences), nghĩa là các đối tượng JavaScript sử dụng các kiểu không tương thích này không thể được tuần tự hóa trực tiếp sang JSON.

_Biểu diễn kiểu JSON_ (JSON type representation) của một đối tượng không tương thích với JSON là một đối tượng JavaScript tương đương có các thuộc tính được mã hóa sao cho thông tin _có thể_ được tuần tự hóa sang JSON.
Thông thường nó có các thuộc tính giống với đối tượng gốc đối với các kiểu dữ liệu tương thích, trong khi các thuộc tính không tương thích được chuyển đổi/tuần tự hóa sang các kiểu tương thích.
Ví dụ, các thuộc tính buffer trong đối tượng gốc có thể được mã hóa {{Glossary("base64", "base64url")}} thành chuỗi trong biểu diễn kiểu JSON.

Một đối tượng không thể tự động tuần tự hóa sang JSON bằng phương thức [`JSON.stringify()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON/stringify) có thể định nghĩa một phương thức thực thể tên `toJSON()` trả về _biểu diễn kiểu JSON_ của đối tượng gốc.
[`JSON.stringify()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON/stringify) sau đó sẽ sử dụng `toJSON()` để lấy đối tượng cần tuần tự hóa, thay vì đối tượng gốc.
[`PublicKeyCredential.toJSON()`](/en-US/docs/Web/API/PublicKeyCredential/toJSON) và [`Performance.toJSON()`](/en-US/docs/Web/API/Performance/toJSON) là các ví dụ về cách tiếp cận này.

Một chuỗi JSON được tuần tự hóa theo cách này có thể được giải tuần tự hóa trở lại thành đối tượng _biểu diễn kiểu JSON_ bằng [`JSON.parse()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON/parse).
Thông thường người ta cung cấp một phương thức chuyển đổi, chẳng hạn {{domxref("PublicKeyCredential.parseCreationOptionsFromJSON_static", "PublicKeyCredential.parseCreationOptionsFromJSON()")}}, để chuyển đổi _biểu diễn kiểu JSON_ trở lại thành đối tượng gốc.
