export const API_BASE_URL = __DEV__
  ? 'http://localhost:8080/api'
  : 'https://api.asilparla.com/api';

export const APP_VERSION = '1.17.02';
export const APP_NAME = 'AsilParla';

export const API_ENDPOINTS = {
  AUTH: '/auth',
  PRODUCTS: '/products',
  ORDERS: '/orders',
  REPORTS: '/reports',
  FINANCE: '/finance',
};

export const STORAGE_KEYS = {
  AUTH_TOKEN: '@asilparla:auth_token',
  USER_DATA: '@asilparla:user_data',
  SETTINGS: '@asilparla:settings',
};
