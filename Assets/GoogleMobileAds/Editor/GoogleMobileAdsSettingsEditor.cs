using UnityEditor;
using UnityEngine;

namespace GoogleMobileAds.Editor
{

    [InitializeOnLoad]
    [CustomEditor(typeof(GoogleMobileAdsSettings))]
    public class GoogleMobileAdsSettingsEditor : UnityEditor.Editor
    {
        [MenuItem("Assets/Google Mobile Ads/Settings...")]
        public static void OpenInspector()
        {
            Selection.activeObject = GoogleMobileAdsSettings.Instance;
        }

        public override void OnInspectorGUI()
        {
            EditorGUILayout.LabelField("Google Mobile Ads App ID", EditorStyles.boldLabel);
            EditorGUI.indentLevel++;

            GoogleMobileAdsSettings.Instance.GoogleMobileAdsAndroidAppId =
                    EditorGUILayout.TextField("Android", "ca-app-pub-9515731482364926~6216970168"
                            /*GoogleMobileAdsSettings.Instance.GoogleMobileAdsAndroidAppId*/);

            GoogleMobileAdsSettings.Instance.GoogleMobileAdsIOSAppId =
                    EditorGUILayout.TextField("iOS",
                            GoogleMobileAdsSettings.Instance.GoogleMobileAdsIOSAppId);

            EditorGUILayout.HelpBox(
                    "Google Mobile  Ads App ID will look similar to this sample ID: ca-app-pub-9515731482364926~6216970168",
                    MessageType.Info);

            EditorGUI.indentLevel--;
            EditorGUILayout.Separator();

            EditorGUILayout.LabelField("AdMob-specific settings", EditorStyles.boldLabel);
            EditorGUI.indentLevel++;

            EditorGUI.BeginChangeCheck();

            GoogleMobileAdsSettings.Instance.DelayAppMeasurementInit =
                    EditorGUILayout.Toggle(new GUIContent("Delay app measurement"),
                    GoogleMobileAdsSettings.Instance.DelayAppMeasurementInit);

            if (GoogleMobileAdsSettings.Instance.DelayAppMeasurementInit) {
                EditorGUILayout.HelpBox(
                        "Delays app measurement until you explicitly initialize the Mobile Ads SDK or load an ad.",
                        MessageType.Info);
            }

            EditorGUI.indentLevel--;
            EditorGUILayout.Separator();

            if (GUI.changed)
            {
                OnSettingsChanged();
            }
        }

        private void OnSettingsChanged()
        {
            EditorUtility.SetDirty((GoogleMobileAdsSettings) target);
            GoogleMobileAdsSettings.Instance.WriteSettingsToFile();
        }
    }
}
