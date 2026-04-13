---
title: "CryptoKey: thuộc tính extractable"
short-title: extractable
slug: Web/API/CryptoKey/extractable
page-type: web-api-instance-property
browser-compat: api.CryptoKey.extractable
---

{{APIRef("Web Crypto API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`extractable`** của giao diện {{DOMxRef("CryptoKey")}} cho biết khóa có thể được trích xuất bằng [`SubtleCrypto.exportKey()`](/en-US/docs/Web/API/SubtleCrypto/exportKey) hoặc [`SubtleCrypto.wrapKey()`](/en-US/docs/Web/API/SubtleCrypto/wrapKey) hay không.

Nếu khóa không thể được xuất, [`exportKey()`](/en-US/docs/Web/API/SubtleCrypto/exportKey) hoặc [`wrapKey()`](/en-US/docs/Web/API/SubtleCrypto/wrapKey) sẽ ném ra ngoại lệ nếu được dùng để trích xuất khóa đó.

## Giá trị

Một giá trị boolean là `true` nếu khóa có thể được xuất và là `false` nếu không thể.

## Ví dụ

Trong ví dụ này, nút _Export_ sẽ bị vô hiệu hóa và không có listener nào được thêm vào nếu khóa không thể được xuất.

```js
// Xuất khóa đã cho và ghi nó vào vùng "exported-key".
async function exportCryptoKey(key) {
  const exported = await window.crypto.subtle.exportKey("raw", key);
  const exportedKeyBuffer = new Uint8Array(exported);

  const exportKeyOutput = document.querySelector(".exported-key");
  exportKeyOutput.textContent = `[${exportedKeyBuffer}]`;
}

// Bật hoặc tắt exportButton tùy theo khóa có extractable hay không
function setExportButton(key) {
  const exportButton = document.querySelector(".raw");

  // Vô hiệu hóa nút nếu khóa không extractable
  exportButton.disabled = !key.extractable;
  if (key.extractable) {
    // Thêm event listener để trích xuất khóa
    exportButton.addEventListener("click", () => {
      exportCryptoKey(key);
    });
  }
}

// Tạo một khóa bí mật dùng cho mã hóa/giải mã,
// rồi bật và thiết lập event listener cho nút "Export".
window.crypto.subtle
  .generateKey(
    {
      name: "AES-GCM",
      length: 256,
    },
    true,
    ["encrypt", "decrypt"],
  )
  .then(setExportButton(key));
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}
