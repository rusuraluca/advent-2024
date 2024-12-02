document.getElementById('generate-btn').addEventListener('click', generatePalette);

function generatePalette() {
    const canvas = document.getElementById('colorCanvas');
    const ctx = canvas.getContext('2d');
    const colorCodesDiv = document.getElementById('colorCodes');

    ctx.clearRect(0, 0, canvas.width, canvas.height);
    colorCodesDiv.innerHTML = '';

    const baseColor = generateRandomColor();

    const numColors = 5;
    const colorWidth = canvas.width / numColors;

    for (let i = 0; i < numColors; i++) {
        const color = generateHarmoniousColor(baseColor, i);
        ctx.fillStyle = color;
        ctx.fillRect(i * colorWidth, 0, colorWidth, canvas.height);

        const hexColor = rgbToHex(color);
        const colorDiv = document.createElement('div');
        colorDiv.classList.add('color-code');

        const colorBox = document.createElement('div');
        colorBox.classList.add('color-box');
        colorBox.style.backgroundColor = color;

        const colorText = document.createElement('p');
        colorText.innerText = hexColor;

        colorDiv.appendChild(colorBox);
        colorDiv.appendChild(colorText);
        colorCodesDiv.appendChild(colorDiv);
    }
}

function generateRandomColor() {
    const r = Math.floor(Math.random() * 256);
    const g = Math.floor(Math.random() * 256);
    const b = Math.floor(Math.random() * 256);
    return `rgb(${r}, ${g}, ${b})`;
}

function generateHarmoniousColor(baseColor, index) {
    const baseRgb = extractRgb(baseColor);
    const hueShift = (index * 30) % 360;

    const hslColor = rgbToHsl(baseRgb[0], baseRgb[1], baseRgb[2]);
    const newHsl = [(hslColor[0] + hueShift) % 360, hslColor[1], hslColor[2]];

    return hslToRgb(newHsl[0], newHsl[1], newHsl[2]);
}

function extractRgb(rgb) {
    return rgb.match(/\d+/g).map(Number);
}

function rgbToHsl(r, g, b) {
    r /= 255;
    g /= 255;
    b /= 255;
    const max = Math.max(r, g, b);
    const min = Math.min(r, g, b);
    const delta = max - min;
    let h, s, l = (max + min) / 2;

    if (delta === 0) {
        h = s = 0;
    } else {
        s = delta / (1 - Math.abs(2 * l - 1));
        switch (max) {
            case r: h = (g - b) / delta + (g < b ? 6 : 0); break;
            case g: h = (b - r) / delta + 2; break;
            case b: h = (r - g) / delta + 4; break;
        }
        h /= 6;
    }

    return [h * 360, s, l];
}

function hslToRgb(h, s, l) {
    s = s || 0;
    l = l || 0;
    h = h / 360;
    let r, g, b;
    if (s === 0) {
        r = g = b = l;
    } else {
        const hue2rgb = (p, q, t) => {
            if (t < 0) t += 1;
            if (t > 1) t -= 1;
            if (t < 1 / 6) return p + (q - p) * 6 * t;
            if (t < 1 / 2) return q;
            if (t < 2 / 3) return p + (q - p) * (2 / 3 - t) * 6;
            return p;
        };

        const q = l < 0.5 ? l * (1 + s) : l + s - l * s;
        const p = 2 * l - q;
        r = hue2rgb(p, q, h + 1 / 3);
        g = hue2rgb(p, q, h);
        b = hue2rgb(p, q, h - 1 / 3);
    }

    return `rgb(${Math.round(r * 255)}, ${Math.round(g * 255)}, ${Math.round(b * 255)})`;
}

function rgbToHex(rgb) {
    const rgbValues = rgb.match(/\d+/g);
    const r = parseInt(rgbValues[0]).toString(16).padStart(2, '0');
    const g = parseInt(rgbValues[1]).toString(16).padStart(2, '0');
    const b = parseInt(rgbValues[2]).toString(16).padStart(2, '0');
    return `#${r}${g}${b}`;
}
