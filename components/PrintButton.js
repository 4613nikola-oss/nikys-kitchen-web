"use client";

// Tisk receptu – v okně tisku jde zvolit i „Uložit jako PDF“
export default function PrintButton({ label }) {
  return (
    <button type="button" className="btn btn-ghost print-button" onClick={() => window.print()}>
      <svg viewBox="0 0 24 24" width="20" height="20" aria-hidden="true">
        <g fill="none" stroke="currentColor" strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round">
          <path d="M5 3h8l4 4v14H5z" />
          <path d="M13 3v4h4" />
          <path d="M11 10v7M8 14l3 3 3-3" />
        </g>
      </svg>
      {label}
    </button>
  );
}
