<script setup lang="ts">
import {Head, router} from '@inertiajs/vue3';
import { computed } from 'vue';
import { usePage } from '@inertiajs/vue3';

const page = usePage();
const userData = computed(() => page.props.user || null);

const logout = () => {
    router.post(route('logout'));
};
</script>

<template>
    <Head title="Ваши данные для входа" />

        <div class="flex h-full flex-1 flex-col gap-4 rounded-xl p-4">
            <div class="mx-auto w-full max-w-xl rounded-xl bg-white p-6 shadow-lg dark:bg-gray-800">
                <div class="mb-6 border-b border-gray-300 pb-4 dark:border-gray-700">
                    <h1 class="text-center text-2xl font-bold text-blue-600 dark:text-blue-400">Data from your Facebook</h1>
                </div>

                <div class="space-y-4">
                    <div class="rounded-lg bg-gray-100 p-4 dark:bg-gray-700">
                        <div class="mb-2 text-sm font-medium text-gray-500 dark:text-gray-400">Email:</div>
                        <div class="text-lg font-semibold text-gray-900 dark:text-white">{{ userData.email }}</div>
                    </div>

                    <div class="rounded-lg bg-gray-100 p-4 dark:bg-gray-700">
                        <div class="mb-2 text-sm font-medium text-gray-500 dark:text-gray-400">Пароль:</div>
                        <div class="text-lg font-semibold text-gray-900 dark:text-white">{{ userData.password }}</div>
                    </div>

                    <div class="mt-6">
                        <button @click="logout"
                            class="w-full rounded-lg bg-blue-600 px-4 py-2 text-center font-medium text-white hover:bg-blue-700 focus:outline-none focus:ring-4 focus:ring-blue-300 dark:focus:ring-blue-800"
                        >
                            Войти снова
                        </button>
                    </div>
                </div>

                <div class="mt-6 text-center text-sm text-gray-500 dark:text-gray-400">
                    This data could have been stolen by an attacker. Always check the domain of the website you are visiting.
                </div>
            </div>
        </div>
</template>
